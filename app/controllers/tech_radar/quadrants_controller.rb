require_dependency "tech_radar/application_controller"

module TechRadar
  class QuadrantsController < ApplicationController
    def show
      @quadrant = TechRadar::Radar.new.quadrant(params[:id])
    end
  end
end
