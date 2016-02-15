class Rule

  def evaluate state, population
    raise "Abstract Rule represents the interface"
  end
end

class Flourishing<Rule
  FERTILE_POBLATION = 3
  def evaluate state, population
    return State.alive if flourishing? state,population
    nil
  end

  def flourishing?  state , population
    state.dead? and fertile? population
  end

  def fertile? population
    population == FERTILE_POBLATION
  end
end

class Overcrowded<Rule
  OVERCROW_TRESHOLD = 3

  def evaluate state, population
    return State.dead if overcrowded? population
    nil
  end

  def overcrowded? population
    population > OVERCROW_TRESHOLD
  end
end

class Underpopulated<Rule
  UNDERPOPULATION_TRESHOLD = 2
  
  def evaluate state, population
    return State.dead if underpopulated? population
    nil
  end
  
  def underpopulated? population
    population < UNDERPOPULATION_TRESHOLD
  end

end

class Healthy<Rule
  MIN_POPULATION=2
  MAX_POPULATION=3
  BALANCED=(MIN_POPULATION..MAX_POPULATION)

  def evaluate state, population
    return State.alive if healthy? state, population
    nil
  end

  def healthy? state, population
    state.alive? and balanced? population
  end  

  def balanced? population
    BALANCED.include? population
  end

end

