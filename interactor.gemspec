$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "interactor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "interactor"
  s.version     = Interactor::VERSION
  s.authors     = ["David Van Der Beek"]
  s.email       = ["earlynovrock@gmail.com"]
  s.homepage    = "http://www.github.com/dvanderbeek/interactor"
  s.summary     = "A simple module for turning objects into interactors that broadcast messages to listeners"
  s.description = "A simple module for turning objects into interactors that broadcast messages to listeners"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 4.2.3"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'factory_girl_rails'
end
