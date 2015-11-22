require_dependency "tech_radar/application_controller"

module TechRadar
  class RingsController < ApplicationController
    def show
      tech_radar = TechRadar::Radar.new
      @all_ring_names = tech_radar.rings.map(&:name)
      @ring = tech_radar.ring(params[:id])
    end
  end
end
