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
  s.description = "Textoken is a Ruby library for text tokenization. This gem extracts words from text with many customizations. It can be used in many fields like Web Crawling and Natural Language Processing."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_development_dependency 'rspec',   '3.5.0'
  s.add_development_dependency 'rake',    '11.3.3'
end
