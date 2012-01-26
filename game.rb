lib_dir = File.expand_path(File.join(File.dirname(__FILE__), "lib"))
$: << lib_dir
require 'game_of_life'

world = world_from_array([[1,1],[1,2],[2,2],[3,1],[1,3],[1,2]])

while true do
  world.draw(120,40)
  sleep 0.2
  world = world.evolve
  puts "\e[H\e[2J"
end