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

    test "show with no more_details_url or more_details_summary" do
      get :show, id: "RabbitMQ"
      assert_response :success
      assert response.body.include?("RabbitMQ"),"Expected #{response.body} to include 'RabbitMQ'"
      assert response.body.include?("Google"),"Expected #{response.body} to include a link to a Google search"
    end

    test "show with no more_details_url but has a more_details_summary" do
      get :show, id: "Ruby"
      assert_response :success
      assert response.body.include?("Ruby"),"Expected #{response.body} to include 'Ruby'"
      refute response.body.include?("Google"),"Expected #{response.body} NOT to include a link to a Google search"
      assert response.body.include?("object-oriented"),"Expected #{response.body} to include Ruby's summary"
    end

    test "show with more_details_url" do
      get :show, id: "Resque"
      assert_response :success
      assert response.body.include?("Resque"),"Expected #{response.body} to include 'Resque'"
      refute response.body.include?("Google"),"Expected #{response.body} NOT to include a link to a Google search"
    end

  end
end
