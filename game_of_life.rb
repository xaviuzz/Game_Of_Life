require "./scenario"
require "./state"

class GameOfLife
  OVERCROW_TRESHOLD = 3
  UNDERPOPULATION_TRESHOLD = 2
  FERTILE_POBLATION = 3
  
  def self.evaluate state, population
    scenario = Scenario.new state, population
    result = scenario.evaluation
    result = State.dead if overcrowded? scenario
    result = State.dead if underpopulated? scenario
    result = State.alive if healthy? scenario
    result = State.alive if flourishing? scenario
    result.to_sym
  end
  
  private

  def self.healthy? scenario
    scenario.state.alive? and balanced? scenario.population
  end  

  def self.flourishing?  scenario
    scenario.state.dead? and fertile? scenario.population
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