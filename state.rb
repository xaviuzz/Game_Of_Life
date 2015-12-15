class State
  def self.from description
    return alive if description == :live_cell
    dead
  end
  def self.alive
    Alive.new
  end
  def self.dead
    Dead.new
  end
  def alive?
    false
  end
  def dead?
    false
  end
end

class Alive<State
  def alive?
    true
  end
  def to_sym
    :live_cell
  end
end

class Dead<State
  def dead?
    true
  end
  def to_sym
    :dead_cell
  end
end