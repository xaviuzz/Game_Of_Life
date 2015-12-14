require './neighbourhood'
require './state'
require './scenario'

class GameOfLife

  def self.evaluate current_state, live_neighbours
    scenario = Scenario.new current_state, live_neighbours
    result = apply_rules scenario
    result.to_s
  end

  def self.apply_rules scenario
    result = scenario.state
    
    UnderPopulation.apply(scenario)
    return scenario.state if scenario.resolved?

    OverCrowded.apply(scenario)
    return scenario.state if scenario.resolved?

    result = State.alive if scenario.state.alive? and scenario.neighbourhood.healthy?
    result = State.alive if scenario.state.dead? and scenario.neighbourhood.flourishing?
    result
  end
end

class Rule
  def self.apply scenario
    return scenario
  end
end


class UnderPopulation < Rule
  def self.apply scenario
    if scenario.state.alive? and scenario.neighbourhood.underpopulated?
      scenario.resolve(State.dead)
    end
  end
end


class OverCrowded < Rule
  def self.apply scenario
    if scenario.state.alive? and scenario.neighbourhood.overcrowded?
      scenario.resolve(State.dead)
    end
  end
end