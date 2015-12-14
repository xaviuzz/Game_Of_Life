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
    
    UnderPopulation.apply(scenario)
    return scenario if scenario.resolved?

    OverCrowded.apply(scenario)
    return scenario if scenario.resolved?

    Healthy.apply(scenario)
    return scenario if scenario.resolved?

    Flourish.apply(scenario)
    return scenario if scenario.resolved?

    
    return scenario
  end
end
