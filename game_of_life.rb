require './neighbourhood'
require './state'
require './scenario'

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

class Healthy < Rule
  def self.apply scenario
    if scenario.state.alive? and scenario.neighbourhood.healthy?
      scenario.resolve(State.alive)
    end
  end
end


class Flourish < Rule
  def self.apply scenario
    if scenario.state.dead? and scenario.neighbourhood.flourishing?
      scenario.resolve(State.alive)
    end
  end
end