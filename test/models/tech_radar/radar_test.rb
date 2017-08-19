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
      assert_equal "Ruby"                            , technology.name
      assert_equal "https://www.ruby-lang.org/en/"   , technology.more_details_url
      assert_equal "Middleware Programming"          , technology.purpose
      assert_equal ["cli", "middleware", "scripting"], technology.tags

      assert_equal "DHH",            technology.experts[0].name
      assert_nil                     technology.experts[0].email
      assert_equal "Matz",           technology.experts[1].name
      assert_nil                     technology.experts[1].email
      assert_equal "Tenderlove",     technology.experts[2].name
      assert_equal "tl@example.com", technology.experts[2].email

      assert_equal "http://github.com/stitchfix/stitches", technology.examples[0].url
      assert_nil                                           technology.examples[0].title
      assert_equal "http://rubyonrails.org",               technology.examples[1].url
      assert_equal "Ruby on Rails Framework",              technology.examples[1].title

      assert_nil technology.why_url
      assert_nil technology.why_summary

      assert_equal "Ruby is a dynamic, _object-oriented_ programming language that combines ideas from Smalltalk, Perl, and others",
                   technology.more_details_summary
    end

    test "rings" do
      assert_equal ["Adopt","Trial","Assess","Hold"],@radar.rings.map(&:name)
      assert_equal [ "Heroku", "RabbitMQ", "Resque", "Ruby", "Weekly sync-ups with Business Partners",],@radar.rings.detect { |ring| ring.name == "Adopt" }.technologies.map(&:name)
    end

    test "tags" do
      technologies = @radar.technologies(tagged: "middleware")
      assert_equal 3, technologies.size
      assert_equal "Heroku", technologies[0].name
      assert_equal "Resque", technologies[1].name
      assert_equal "Ruby", technologies[2].name
    end

  end
end
