# -*- encoding: utf-8 -*-
# stub: to_xls-rails 1.3.1 ruby lib

Gem::Specification.new do |s|
  s.name = "to_xls-rails"
  s.version = "1.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.4") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mike Liang"]
  s.date = "2014-11-19"
  s.description = "This simple plugin gives you the ability to call to_xls to a collection of activerecords for Rails."
  s.email = "liangwenke.com@gmail.com"
  s.homepage = "http://github.com/liangwenke/to_xls-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.8"
  s.summary = "Export Rails ActiveRecord data to excel file"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<spreadsheet>, [">= 0.8.5"])
    else
      s.add_dependency(%q<spreadsheet>, [">= 0.8.5"])
    end
  else
    s.add_dependency(%q<spreadsheet>, [">= 0.8.5"])
  end
end
