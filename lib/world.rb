require 'set'
require 'forwardable'

class World

  attr_reader :world
  extend Forwardable
  include Enumerable

  def self.delegate_to_world(*methods)
    methods.each do |method|
      define_method method do |other|
        @world.send(method, other.is_a?(World) ? other.world : other)
      end
    end
  end

  delegate_to_world :==, :|, :&
  def_delegators :@world, :<<, :length, :each, :-, :delete, :include?

	def initialize(cells=nil)
    @world = Set.new(cells)
  end

  def surroundings
    World.new(@world.collect(&:surroundings).inject(World.new){|a,b| a | b})
  end

	def evolve
    World.new.tap do |new_world|
      self.surroundings.each do |cell|
        cell_neighbors_count = (cell.surroundings & (self -[cell])).length
        if cell_neighbors_count==3 || cell_neighbors_count==2 && self.include?(cell)
          new_world << cell
        end
      end
    end
  end

  def draw(x,y)
    (-y/2..y/2).each do |yy|
      puts((-x/2..x/2).collect do |xx|
        @world.include?(Cell.new(xx,yy)) ? '#' : '.'
      end.join(''))
    end
  end
end
