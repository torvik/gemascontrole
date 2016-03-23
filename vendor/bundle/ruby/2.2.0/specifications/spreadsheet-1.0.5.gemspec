# -*- encoding: utf-8 -*-
# stub: spreadsheet 1.0.5 ruby lib

Gem::Specification.new do |s|
  s.name = "spreadsheet"
  s.version = "1.0.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Masaomi Hatakeyama, Zeno R.R. Davatz"]
  s.date = "2015-09-01"
  s.description = "The Spreadsheet Library is designed to read and write Spreadsheet Documents.\nAs of version 0.6.0, only Microsoft Excel compatible spreadsheets are\nsupported. Spreadsheet is a combination/complete rewrite of the\nSpreadsheet::Excel Library by Daniel J. Berger and the ParseExcel Library by\nHannes Wyss. Spreadsheet can read, write and modify Spreadsheet Documents."
  s.email = ["mhatakeyama@ywesee.com, zdavatz@ywesee.com"]
  s.executables = ["xlsopcodes"]
  s.extra_rdoc_files = ["GUIDE.md", "History.md", "LICENSE.txt", "Manifest.txt", "README.md"]
  s.files = ["GUIDE.md", "History.md", "LICENSE.txt", "Manifest.txt", "README.md", "bin/xlsopcodes"]
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.md"]
  s.rubyforge_project = "spreadsheet"
  s.rubygems_version = "2.4.8"
  s.summary = "The Spreadsheet Library is designed to read and write Spreadsheet Documents"

  s.installed_by_version = "2.4.8" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<ruby-ole>, [">= 1.0"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.7"])
    else
      s.add_dependency(%q<ruby-ole>, [">= 1.0"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<hoe>, ["~> 3.7"])
    end
  else
    s.add_dependency(%q<ruby-ole>, [">= 1.0"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<hoe>, ["~> 3.7"])
  end
end
