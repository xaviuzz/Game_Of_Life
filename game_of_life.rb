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
    rules=[
      Flourishing.new,
      Overcrowded.new,
      Healthy.new,
      Underpopulated.new
    ]

    rules.each do |rule|
      rule.apply scenario
    end
    
  end

  
end