module TechRadar
  module ApplicationHelper
    def label_color_for_ring(ring_name)
      if ring_name == 'Adopt'
        :success
      elsif ring_name == 'Hold'
        :warning
      else
        :default
      end
    end

    def panel_type_for_technology_why(technology)
      if technology.why_summary.blank? && warn_on_missing_why?(technology)
        :warning
      else
        :default
      end
    end

    def warn_on_missing_why?(technology)
      technology.ring != 'Adopt' && technology.ring != 'Trial'
    end

    def render_summary(summary_text)
      TechRadar::Rendering.renderer.render_text(summary_text)
    end

  end
end
