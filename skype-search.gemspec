$:.push File.expand_path("../lib", __FILE__)
require "skype_search/version"

Gem::Specification.new do |s|
  s.name        = "skype-search"
  s.version     = SkypeSearch::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = "Despo Pentara"
  s.email       = "despo@extractmethod.com"
  s.homepage    = "https://github.com/despo/skype-search"
  s.summary     = "Search and retrieve Skype conversations from the cli"
  s.description = "Search and retrieve Skype conversations from the cli"
  s.required_ruby_version = '>= 1.9.2'

  s.licenses = ["MIT"]

  s.files              = `git ls-files`.split("\n")
  s.test_files         = `git ls-files -- {spec}/*`.split("\n")
  s.executables        = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths      = ["lib"]

  s.add_dependency "activerecord"
  s.add_dependency "sqlite3"
  s.add_dependency "highline"

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
end
