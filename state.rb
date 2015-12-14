class State
	def self.create(description)
		result = State.new
		result = Alive.new if description == :live_cell
		return result
	end
	
	def alive?
	end
end

class Alive < State
	def alive?
		true
	end
end