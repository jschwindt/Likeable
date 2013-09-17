# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "likeable"
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Schneems"]
  s.date = "2011-12-17"
  s.description = "\n    Likeable allows you to make your models...well...likeable using redis.\n  "
  s.email = "richard.schneeman@gmail.com"
  s.extra_rdoc_files = ["README.md"]
  s.files = [".autotest", ".rspec", "Gemfile", "README.md", "Rakefile", "VERSION", "autotest/discover.rb", "lib/likeable.rb", "lib/likeable/adapters/default_adapter.rb", "lib/likeable/adapters/mongoid_adapter.rb", "lib/likeable/adapters/ohm_adapter.rb", "lib/likeable/facepile.rb", "lib/likeable/like.rb", "lib/likeable/module_methods.rb", "lib/likeable/user_methods.rb", "license.txt", "likeable.gemspec", "spec/likeable/adapters/mongoid_adapter_spec.rb", "spec/likeable/adapters/ohm_adapter_spec.rb", "spec/likeable/facepile_spec.rb", "spec/likeable/like_spec.rb", "spec/likeable/module_methods_spec.rb", "spec/likeable/setup_spec.rb", "spec/likeable/user_methods_spec.rb", "spec/likeable_spec.rb", "spec/spec_helper.rb"]
  s.homepage = "https://github.com/schneems/Likeable"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.3"
  s.summary = "Like ruby objects backed by redis"
  s.test_files = ["spec/likeable/adapters/mongoid_adapter_spec.rb", "spec/likeable/adapters/ohm_adapter_spec.rb", "spec/likeable/facepile_spec.rb", "spec/likeable/like_spec.rb", "spec/likeable/module_methods_spec.rb", "spec/likeable/setup_spec.rb", "spec/likeable/user_methods_spec.rb", "spec/likeable_spec.rb", "spec/spec_helper.rb"]

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_runtime_dependency(%q<keytar>, [">= 1.5.2"])
      s.add_runtime_dependency(%q<redis>, [">= 0"])
      s.add_development_dependency(%q<activerecord>, ["~> 3.0.4"])
      s.add_development_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_development_dependency(%q<autotest-standalone>, [">= 0"])
      s.add_development_dependency(%q<autotest-growl>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<keytar>, [">= 1.5.2"])
      s.add_dependency(%q<redis>, [">= 0"])
      s.add_dependency(%q<activerecord>, ["~> 3.0.4"])
      s.add_dependency(%q<rake>, ["~> 0.8.7"])
      s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
      s.add_dependency(%q<autotest-standalone>, [">= 0"])
      s.add_dependency(%q<autotest-growl>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<keytar>, [">= 1.5.2"])
    s.add_dependency(%q<redis>, [">= 0"])
    s.add_dependency(%q<activerecord>, ["~> 3.0.4"])
    s.add_dependency(%q<rake>, ["~> 0.8.7"])
    s.add_dependency(%q<jeweler>, ["~> 1.5.2"])
    s.add_dependency(%q<autotest-standalone>, [">= 0"])
    s.add_dependency(%q<autotest-growl>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 0"])
  end
end
