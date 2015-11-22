require_dependency "tech_radar/application_controller"

module TechRadar
  class RadarController < ApplicationController
    def index
      @hide_nav = true
      @radar = TechRadar::Radar.new
    end

    def summary
      @radar = TechRadar::Radar.new
    end
  end
end
