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
  s.summary     = "Simple and customizable text tokenization gem."
  s.description = "TODO: Description of Textoken."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_development_dependency "rspec"
end
