require 'spec_helper'
require 'game_of_life'

describe Cell do
  it 'can be initialized with proper values' do
    cell = Cell.new(1,2)
    cell.x.should be 1
    cell.y.should be 2
  end

  describe '#surroundings' do
    it 'returns World instance with cell and surrounding cells #1' do
      cell = Cell.new(1,1)
      cell.surroundings.should == world_from_array([[0,0], [0,1], [0,2],
                                                   [1,0], [1,1], [1,2],
                                                   [2,0], [2,1], [2,2]])
    end

    it 'returns World instance with cell and surrounding cells #2' do
      cell = Cell.new(2,-11)
      cell.surroundings.should == world_from_array([[1, -12], [1, -11], [1, -10],
                                                   [2, -12], [2, -11], [2, -10],
                                                   [3, -12], [3, -11], [3, -10]])
    end
  end
end