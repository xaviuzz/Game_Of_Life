require './game_of_life'
require './world'
require 'rspec'

describe "The world of the Conway's game of life" do

  it "Starts with a world description" do
    empty_world=
      """...
          ...
          ...
      """
      expect(World.new(empty_world).population).to eq 0
  end

  it "Alive cells are X" do
    solitary_cell=
      """...
          ..X
          ...
      """
      expect(World.new(solitary_cell).population).to eq 1
  end

  it "Provides scenarios" do
    solitary_cell=
      """...
          ..X
          ...
      """
      world= World.new solitary_cell
      expect(world.next).to eq [:dead_cell,0]
      expect(world.next).to eq [:dead_cell,1]
      expect(world.next).to eq [:dead_cell,1]
      expect(world.next).to eq [:dead_cell,0]
      expect(world.next).to eq [:dead_cell,1]
      expect(world.next).to eq [:live_cell,0]
      expect(world.next).to eq [:dead_cell,0]
      expect(world.next).to eq [:dead_cell,1]
      expect(world.next).to eq [:dead_cell,1]
  end

  it "Notifies the end of the world" do
    solitary_cell=
      """...
          ..X
          ...
      """
      world= World.new solitary_cell
      9.times{world.next}
      expect{world.next}.to raise_error "It's the end of the world"
  end

end
