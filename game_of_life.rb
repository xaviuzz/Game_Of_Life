class GameOfLife
  OVERCROW_TRESHOLD = 3
  UNDERPOPULATION_TRESHOLD = 2
  FERTILE_POBLATION = 3
  
  def self.evaluate state, population
    result = state
    result = :dead_cell if overcrowded? population 
    result = :dead_cell if underpopulated? population
    result = :live_cell if healthy? state, population
    result = :live_cell if flourishing? state, population
    result
  end
  
  private

  def self.healthy? state, population
    state==:alive_cell and balanced? population
  end  

  def self.flourishing? state, population
    state==:dead_cell and fertile? population
  end

  def self.overcrowded? population
    population > OVERCROW_TRESHOLD
  end
  
  def self.underpopulated? population
    population < UNDERPOPULATION_TRESHOLD
  end

  def self.balanced? population
    population<OVERCROW_TRESHOLD  and population > UNDERPOPULATION_TRESHOLD
  end

  def self.fertile? population
    population == FERTILE_POBLATION
  end
end