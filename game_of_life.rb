require "./scenario"
class GameOfLife
  OVERCROW_TRESHOLD = 3
  UNDERPOPULATION_TRESHOLD = 2
  FERTILE_POBLATION = 3
  
  def self.evaluate state, population
    scenario = Scenario.new state, population
    result = scenario.evaluation
    result = :dead_cell if overcrowded? scenario
    result = :dead_cell if underpopulated? scenario
    result = :live_cell if healthy? scenario
    result = :live_cell if flourishing? scenario
    result
  end
  
  private

  def self.healthy? scenario
    scenario.state==:alive_cell and balanced? scenario.population
  end  

  def self.flourishing?  scenario
    scenario.state==:dead_cell and fertile? scenario.population
  end

  def self.overcrowded? scenario
    scenario.population > OVERCROW_TRESHOLD
  end
  
  def self.underpopulated? scenario
    scenario.population < UNDERPOPULATION_TRESHOLD
  end

  def self.balanced? population
    population<OVERCROW_TRESHOLD  and population > UNDERPOPULATION_TRESHOLD
  end

  def self.fertile? population
    population == FERTILE_POBLATION
  end
end