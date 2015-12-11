class GameOfLife
  def self.evaluate (state, live_neighbours)
  	return :live_cell if must_live? live_neighbours
    :dead_cell
  end

  private

  def self.must_live? live_neighbours
  	live_neighbours == 2 or live_neighbours == 3
  end

end