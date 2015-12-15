class GameOfLife
  OVERCROW_TRESHOLD = 3
  UNDERPOPULATION_TRESHOLD = 2
  FERTILE_POBLATION = 3
  
  def self.evaluate state, live_neighbours
    result = state
    result = :dead_cell if overcrowded? live_neighbours 
    result = :dead_cell if underpopulated? live_neighbours
    result = :live_cell if healthy? state, live_neighbours
    result = :live_cell if flourishing? state, live_neighbours
    result
  end
  
  private

  def self.healthy? state, live_neighbours
    state==:alive_cell and balanced? live_neighbours
  end  

  def self.flourishing? state, live_neighbours
    state==:dead_cell and fertile? live_neighbours
  end

  def self.overcrowded? live_neighbours
    live_neighbours > OVERCROW_TRESHOLD
  end
  
  def self.underpopulated? live_neighbours
    live_neighbours < UNDERPOPULATION_TRESHOLD
  end

  def self.balanced? live_neighbours
    live_neighbours<OVERCROW_TRESHOLD  and live_neighbours > UNDERPOPULATION_TRESHOLD
  end

  def self.fertile? live_neighbours
    live_neighbours == FERTILE_POBLATION
  end
end