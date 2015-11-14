require_dependency "tech_radar/application_controller"

module TechRadar
  class TechnologiesController < ApplicationController
    def index
      @technologies = TechRadar::Radar.new.technologies
    end

    def show
      @technology = TechRadar::Radar.new.technology(params[:id])
    end
  end
end
