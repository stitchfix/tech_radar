$:.push File.expand_path("../lib", __FILE__)

require "tech_radar/version"

Gem::Specification.new do |s|
  s.name        = "tech_radar"
  s.version     = TechRadar::VERSION
  s.authors     = ["Stitch Fix Engineering", "Dave Copeland"]
  s.email       = ["eng@stitchfix.com", "davetron5000@gmail.com"]
  s.homepage    = "https://github.com/stitchfix/tech_radar"
  s.summary     = "Rails engine to create and manage your own team's Technology Radar"
  s.description = "Rails engine to create and manage your own team's Technology Radar"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"
  s.add_dependency "i18n"
  s.add_dependency "immutable-struct"

  s.add_development_dependency "mocha"
end
