require './game_of_life'
require 'rspec'

describe "In the Conway's game of life " do

	it "Any live cell with fewer than two live neighbours dies, as if caused by underpopulation" do
    neighbours = 1
    expect(fewerThanTwo?(neighbours)).to eq true
    expect(GameOfLife.evaluate(:live_cell,neighbours)).to eq :dead_cell
	end

  it "Any live cell with more than three live neighbours dies, as if by overcrowding" do
    neighbours = 4
    expect(moreThanThree?(neighbours)).to eq true
    expect(GameOfLife.evaluate(:live_cell,neighbours)).to eq :dead_cell
  end

  it "Any live cell with two or three live neighbours lives on to the next generation" do
    neighbours = 2
    withTwoOrThree! neighbours
    expect(GameOfLife.evaluate(:live_cell,neighbours)).to eq :live_cell
  end

end

def withTwoOrThree! number
  expect(moreThanThree?(number)).to eq false
  expect(fewerThanTwo?(number)).to eq false
end

def fewerThanTwo? number
    number < 2
end


def moreThanThree? number
    number > 3
end