require './neighbourhood'
require './state'

class GameOfLife

  def self.evaluate (current_state, live_neighbours)
  	state = State.create(current_state)
  	neighbourhood = Neighbourhood.new(live_neighbours)

  	return :live_cell if state.alive? and neighbourhood.healthy?
    
    :dead_cell
  end
end
