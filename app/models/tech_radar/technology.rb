require 'immutable-struct'

module TechRadar
end
TechRadar::Technology = ImmutableStruct.new(:name, :ring, :quadrant, :purpose, :why_summary, :why_url, :more_details_summary, :more_details_url)
