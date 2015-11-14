require 'immutable-struct'

module TechRadar
end
TechRadar::Technology = ImmutableStruct.new(:name, :ring, :quadrant, :purpose, :notes, :what_url, :why_url)
