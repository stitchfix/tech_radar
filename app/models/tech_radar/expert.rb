require 'immutable-struct'

module TechRadar
end
TechRadar::Expert = ImmutableStruct.new(:name, :email)
