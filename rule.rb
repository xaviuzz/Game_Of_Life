class Rule
  def apply scenario
    raise "Abstract Rule represents the interface"
  end
end

class Flourishing<Rule
  FERTILE_POBLATION = 3
  
  def apply scenario
    scenario.resolve (State.alive) if flourishing? scenario
  end

  def flourishing?  scenario
    scenario.state.dead? and fertile? scenario.population
  end

  def fertile? population
    population == FERTILE_POBLATION
  end
end

class Overcrowded<Rule
  OVERCROW_TRESHOLD = 3

  def apply scenario
    scenario.resolve (State.dead) if overcrowded? scenario
  end

  def overcrowded? scenario
    scenario.population > OVERCROW_TRESHOLD
  end
end

class Underpopulated<Rule
  UNDERPOPULATION_TRESHOLD = 2
  
  def apply scenario
    scenario.resolve (State.dead) if underpopulated? scenario
  end
  
  def underpopulated? scenario
    scenario.population < UNDERPOPULATION_TRESHOLD
  end

end

class Healthy<Rule
  MIN_POPULATION=2
  MAX_POPULATION=3
  BALANCED=(MIN_POPULATION..MAX_POPULATION)

  def apply scenario
    scenario.resolve (State.alive) if healthy? scenario
  end

  def healthy? scenario
    scenario.state.alive? and balanced? scenario.population
  end  

  def balanced? population
    BALANCED.include? population
  end

end

