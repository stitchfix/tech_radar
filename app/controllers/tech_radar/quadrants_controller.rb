require_dependency "tech_radar/application_controller"

module TechRadar
  class QuadrantsController < ApplicationController
    def show
      tech_radar = TechRadar::Radar.new
      @all_quadrant_names = tech_radar.quadrants.map(&:name)
      @quadrant = tech_radar.quadrant(params[:id])
    end
  end
end
