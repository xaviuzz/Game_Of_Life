require './neighbourhood'
require './state'

class GameOfLife

  def self.evaluate (current_state, live_neighbours)
    state = State.create(current_state)
  	neighbourhood = Neighbourhood.new(live_neighbours)
    result = State.dead
  	result = State.alive if state.alive? and neighbourhood.healthy?
    result = State.alive if state.dead? and neighbourhood.flourishing?
    result.to_s
  end
end
