require 'immutable-struct'

module TechRadar
end
TechRadar::Example = ImmutableStruct.new(:url, :title)
