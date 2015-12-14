require './neighbourhood'
require './state'
require './scenario'
require './rule'

class GameOfLife

  def self.evaluate current_state, live_neighbours
    scenario = Scenario.new current_state, live_neighbours
    result = apply_rules scenario
    result.state.to_s
  end

  def self.apply_rules scenario
    rules=[
        UnderPopulation.new,
        OverCrowded.new,
        Healthy.new,
        Flourish.new      
    ]

    rules.each do |rule|
      rule.apply(scenario)
      break if scenario.resolved?      
    end
    
    scenario
  end
end
