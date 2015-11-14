$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "tech_radar/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "tech_radar"
  s.version     = TechRadar::VERSION
  s.authors     = ["Dave Copeland"]
  s.email       = ["davetron5000@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of TechRadar."
  s.description = "TODO: Description of TechRadar."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"
end
