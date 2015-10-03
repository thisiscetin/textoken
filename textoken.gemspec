$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "textoken/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "textoken"
  s.version     = Textoken::VERSION
  s.authors     = ["Mehmet Cetin"]
  s.email       = ["mcetin.cm@gmail.com"]
  s.homepage    = "https://github.com/manorie/textoken"
  s.summary     = "Simple and customizable text tokenization gem."
  s.description = "Textoken extracts words from text with many customizations."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_development_dependency 'rspec',   '~> 3.3.0', '>= 3.3.0'
  s.add_development_dependency 'rake',    '~> 10.0'
  s.add_development_dependency 'pry',     '~> 0'
end
