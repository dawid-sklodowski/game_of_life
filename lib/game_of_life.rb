 require 'cell'
 require 'world'

 def world_from_array(coordinates_array)
  World.new(coordinates_array.collect{|coordinates| Cell.new(*coordinates)})
end

