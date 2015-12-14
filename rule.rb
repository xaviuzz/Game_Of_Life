
class Rule
  def apply scenario
    return scenario
  end
end


class UnderPopulation < Rule
  def apply scenario
    if scenario.state.alive? and scenario.neighbourhood.underpopulated?
      scenario.resolve(State.dead)
    end
  end
end


class OverCrowded < Rule
  def apply scenario
    if scenario.state.alive? and scenario.neighbourhood.overcrowded?
      scenario.resolve(State.dead)
    end
  end
end

class Healthy < Rule
  def apply scenario
    if scenario.state.alive? and scenario.neighbourhood.healthy?
      scenario.resolve(State.alive)
    end
  end
end


class Flourish < Rule
  def apply scenario
    if scenario.state.dead? and scenario.neighbourhood.flourishing?
      scenario.resolve(State.alive)
    end
  end
end