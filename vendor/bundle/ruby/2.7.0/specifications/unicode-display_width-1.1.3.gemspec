# -*- encoding: utf-8 -*-
# stub: unicode-display_width 1.1.3 ruby lib

Gem::Specification.new do |s|
  s.name = "unicode-display_width".freeze
  s.version = "1.1.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jan Lelis".freeze]
  s.date = "2017-01-13"
  s.description = "[Unicode 9.0.0] Determines the monospace display width of a string using EastAsianWidth.txt, Unicode general category, and other data.".freeze
  s.email = "mail@janlelis.de".freeze
  s.extra_rdoc_files = ["README.md".freeze, "MIT-LICENSE.txt".freeze, "CHANGELOG.txt".freeze]
  s.files = ["CHANGELOG.txt".freeze, "MIT-LICENSE.txt".freeze, "README.md".freeze]
  s.homepage = "http://github.com/janlelis/unicode-display_width".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Determines the monospace display width of a string in Ruby.".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.4"])
  else
    s.add_dependency(%q<rspec>.freeze, ["~> 3.4"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.4"])
  end
end
