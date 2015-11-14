require 'test_helper'

module TechRadar
  class RadarTest < ActiveSupport::TestCase

    setup do
      @radar = TechRadar::Radar.new
    end

    test "quadrants" do
      assert_equal ["Tools", "Platforms", "Techniques", "Languages and Frameworks"], @radar.quadrants.map(&:name)
    end

    test "quadrant" do
      assert_equal ["RabbitMQ", "Resque" ], @radar.quadrant("Tools").rings.detect { |ring| ring.name == "Adopt" }.technologies.map(&:name)
    end

    test "technologies" do
      expected_names = [
        "AWS",
        "Cloudfront",
        "CoffeeScript",
        "Consumer-driven tests for services",
        "ElasticSearch",
        "Heroku",
        "HTTP Services",
        "HumbleKit",
        "iOS",
        "JIRA",
        "JQuery",
        "Objective-C",
        "RabbitMQ",
        "Redis as a database",
        "Resque",
        "Ruby",
        "Shared Gems",
        "Sidekiq",
        "SwiftTask",
        "Weekly sync-ups with Business Partners",
      ]
      assert_equal expected_names,@radar.technologies.map(&:name) 
    end

    test "technology" do
      technology = @radar.technology("Ruby")
      assert_equal "Ruby"                          , technology.name
      assert_equal "https://www.ruby-lang.org/en/" , technology.what_url.url
      assert_equal nil                             , technology.why_url.url
      assert_equal "Middleware Programming"        , technology.purpose
    end

  end
end
