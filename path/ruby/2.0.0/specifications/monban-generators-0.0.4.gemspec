# -*- encoding: utf-8 -*-
# stub: monban-generators 0.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "monban-generators"
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["halogenandtoast"]
  s.date = "2014-07-14"
  s.description = "Generators to add in different forms of user authentication to a rails application."
  s.email = ["halogenandtoast@gmail.com"]
  s.homepage = "http://github.com/halogenandtoast/monban-generators"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.3.0"
  s.summary = "Rails generators for the monban authentication library"

  s.installed_by_version = "2.3.0" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>, ["~> 1.5"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_runtime_dependency(%q<monban>, [">= 0.0.12"])
    else
      s.add_dependency(%q<bundler>, ["~> 1.5"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<monban>, [">= 0.0.12"])
    end
  else
    s.add_dependency(%q<bundler>, ["~> 1.5"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<monban>, [">= 0.0.12"])
  end
end
