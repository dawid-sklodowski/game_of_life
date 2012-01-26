class Cell
  attr_reader :x, :y
  @instances = {}

  class << self
    alias :_new :new
  end

  def self.new(x,y)
    @instances[[x,y]] ||= self._new(x,y)
  end

  def surroundings
    @surroundings ||=
    World.new.tap do |world|
      (-1..1).collect do |x|
        (-1..1).collect do |y|
          Cell.new(@x+x, @y+y)
        end
      end.flatten.each{|cell| world << cell}
    end
  end

  def initialize(x,y)
    @x = x
    @y = y
  end
end