require './neighbourhood'
require './state'

class GameOfLife

  def self.evaluate (current_state, live_neighbours)
    state = State.create(current_state)
  	neighbourhood = Neighbourhood.new(live_neighbours)
  	state = State.dead unless state.alive? and neighbourhood.healthy?
    state = State.alive if state.dead? and neighbourhood.flourishing?
    state.to_s
  end
end
