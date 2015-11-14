require 'test_helper'

module TechRadar
  class TechnologiesControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test "index" do
      get :index
      assert_response :success
      regexp = Regexp.new([
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
      ].map { |_| Regexp.escape(_) }.join(".*"), Regexp::MULTILINE)
      assert (response.body =~ regexp),"Expected #{response.body} to include the technologies in order"
    end

    test "show" do
      get :show, id: "Resque"
      assert_response :success
      assert response.body.include?("Resque"),"Expected #{response.body} to include 'Resque'"
    end

  end
end
