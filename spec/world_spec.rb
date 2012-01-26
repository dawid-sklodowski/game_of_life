require 'spec_helper'
require 'game_of_life'

describe World do
  it 'can be initialized' do
    expect{World.new([Cell.new(1,2), Cell.new(2,2)])}.to_not raise_error
  end

  describe '#length' do
    it 'returns proper length' do
      World.new([Cell.new(1,2), Cell.new(2,2)]).length.should == 2
    end
  end

  describe '#surroundings' do
    it 'returns world with surrounding cells #1' do
      world = World.new([Cell.new(1,1)])
      world.surroundings.should == world_from_array([[0,0], [0,1], [0,2],
                                                     [1,0], [1,1], [1,2],
                                                     [2,0], [2,1], [2,2]])
    end

    it 'returns world with surrounding cells #2' do
      world = World.new([Cell.new(1,1), Cell.new(1,2)])
      world.surroundings.should == world_from_array([[0,0], [0,1], [0,2], [0,3],
                                               [1,0], [1,1], [1,2], [1,3],
                                               [2,0], [2,1], [2,2], [2,3]])
    end
  end

  describe '#evolve' do
    it 'returns world in next heart beat #1' do
      world_from_array([[1,1],
                        [1,2],
                        [2,2]]).evolve.should == world_from_array([[1,1],
                                                                   [1,2],
                                                                   [2,1],
                                                                   [2,2]])
    end

    it 'returns world in next heart beat #2'   do
      world_from_array([[1,1]]).evolve.should == World.new
    end

    it 'returns world in next heart beat #3'   do
      world_from_array([[1,1],[12,3],[12,24]]).evolve.should == World.new
    end
  end
end