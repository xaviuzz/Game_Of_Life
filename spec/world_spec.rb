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


end
