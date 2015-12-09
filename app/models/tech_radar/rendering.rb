module TechRadar
  module Rendering
    def self.renderer
      @renderers ||= {}
      @renderers[TechRadar.summary_format] ||= "tech_radar/rendering/#{TechRadar.summary_format}".classify.constantize.new
      @renderers[TechRadar.summary_format]
    end
  end
end
