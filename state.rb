class State
	def self.create(description)
		result = nil
		result = alive if description == :live_cell
    result = dead if description == :dead_cell
		return result
	end

  def self.alive
    return Alive.new
  end
  
  def self.dead
    return Dead.new
  end


	def alive?
	end
  def dead?
  end
  def to_s
  end

  private
  def initialize
  end

end

class Alive < State
	def alive?
		true
	end
  def dead?
    false
  end
  def to_s
    :live_cell
  end
end

class Dead < State
  def alive?
    false
  end
  def dead?
    true
  end
  def to_s
    :dead_cell
  end
end