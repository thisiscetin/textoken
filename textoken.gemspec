$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "textoken/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "textoken"
  s.version     = Textoken::VERSION
  s.authors     = ["Mehmet Cetin"]
  s.email       = ["mcetin.cm@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Textoken."
  s.description = "TODO: Description of Textoken."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.4"

  s.add_development_dependency "sqlite3"
end
