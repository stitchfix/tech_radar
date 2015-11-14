require 'immutable-struct'
module TechRadar
end
TechRadar::Quadrant = ImmutableStruct.new(:name, [:rings])
