require 'redis'

module Likeable
  mattr_accessor :facepile_default_limit
  self.facepile_default_limit = 9


  ### Module Methods ###
  # ------------------ #
  class << self
    def classes
      @classes||[]
    end

    def classes=(*args)
      @classes = args
    end

      # Likeable.model("Highlight")
      # ------------------------- #
      # turns a string into a model
      # "Highlight".constantize # => Highlight; "Hi1i6ht".constantize = #=> false
      def model(target_model)
        target_model.camelcase.constantize
      rescue NameError => ex
        return false
      end

      # Likeable.find_by_resource_id("highlight", 22)
      # ---------------------------------------- #
      # #<Highlight id: ... # if highlight 22 exists
      # nil                 # if highlight 22 does not exist
      def find_by_resource_id(resource_name, target_id)
        target = Likeable.get_class_for_resource_name(resource_name)
        if target.present?
          Likeable.find_one(target, target_id)
        else
          false
        end
      end

      # Likeable.get_class_for_resource_name('photo')
      # ------------------------- #
      # Returns the class for the resource name
      def get_class_for_resource_name(resource_name)
        self.model(resource_name)
      end

      def redis
        @redis ||= Redis.new
      end

      def redis=(redis)
        @redis = redis
      end

      def after_like(&block)
        @after_like = block if block.present?
        @after_like ||= lambda {}
        @after_like
      end

      def find_many(klass, ids)
        @find_many ||= lambda {|klass, ids| klass.where(:id => ids)}
        @find_many.call(klass, ids)
      end


      def find_one(klass, id)
        @find_one ||= lambda {|klass, ids| klass.where(:id => id)}
        @find_one.call(klass, id)
      end

      def find_one=(find_one)
        @find_one = find_one
      end

      def user_class
        @user_class ||= ::User
      end

      def user_class=(user)
        raise "User must be a class #{user.inspect}" unless user.class == Class
        @user_class = user
      end

      # Likeable.setup do |like|
      #  like.redis     = Redis.new(#...)
      #  like.find_one  = lambda {|klass, id | klass.where(:id => id)}
      #  like.find_many = lambda {|klass, ids| klass.where(:id => ids)}
      #  like.classes   = Spot, Comment
      # end

      def make_classes_likeable
        classes.each do |klass|
          klass.send :include, Likeable
        end
      end

      def give_users_like_ability
        user_class.send :include, ::Likeable::UserMethods
      end

      def setup(&block)
        yield self unless block.blank?
        make_classes_likeable
        give_users_like_ability
        true
      end
    end
end