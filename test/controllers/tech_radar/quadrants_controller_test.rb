require 'test_helper'

module TechRadar
  class QuadrantsControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
    end

    test "show" do
      get :show, id: "Tools"
      assert_response :success
      assert response.body =~ /RabbitMQ.*Resque.*ElasticSearch.*HumbleKit.*Redis as a database.*Sidekiq.*JIRA.*SwiftTask/m,
        "Expected #{response.body} to contain all 'Tools' technologies, ordered by ring, then name"
    end

  end
end
