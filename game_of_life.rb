require "./scenario"
require "./state"
require "./rule"
require "./rules"

class GameOfLife
  
  def self.evaluate state, population
    scenario = Scenario.new state, population
    apply_rules scenario
    scenario.evaluation
  end
  
  private

  def self.apply_rules scenario
    Rules.new.apply scenario
  end

  
end