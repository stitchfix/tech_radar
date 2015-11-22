require "tech_radar/engine"

module TechRadar
  # A Hash with keys named for the four rings as written in the en.yml file (i.e. not the translated values).  
  # If the value is true, a warning is shown for any tech that doesn't have a "why_summary".
  #
  # Default is true for all rings.
  mattr_accessor :warn_on_missing_why_summary

  TechRadar.warn_on_missing_why_summary = Hash.new(true)
end
