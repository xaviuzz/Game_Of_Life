require "./scenario"
require "./state"
require "./rule"

class GameOfLife
  
  def self.evaluate state, population
    scenario = Scenario.new state, population
    apply_rules scenario
    scenario.evaluation
  end
  
  private

  def self.apply_rules scenario
    Flourishing.new.apply scenario
    Overcrowded.new.apply scenario
    Healthy.new.apply scenario
    Underpopulated.new.apply scenario
  end

  
end