require 'test_helper'

module TechRadar
  class RenderingTest < ActiveSupport::TestCase

    test "plaintext" do
      TechRadar.summary_format = :plaintext
      renderer = Rendering.renderer

      assert_equal TechRadar::Rendering::Plaintext,renderer.class
    end

    test "markdown" do
      TechRadar.summary_format = :markdown
      renderer = Rendering.renderer

      assert_equal TechRadar::Rendering::Markdown,renderer.class
    end

  end
end
