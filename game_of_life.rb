require './neighbourhood'
require './state'

class GameOfLife

  def self.evaluate (current_state, live_neighbours)
    state = State.create(current_state)
  	neighbourhood = Neighbourhood.new(live_neighbours)

    result = apply_rules state,neighbourhood
    result.to_s
  end

  def apply_rules state, neighbourhood
    result = State.dead
    result = State.alive if state.alive? and neighbourhood.healthy?
    result = State.alive if state.dead? and neighbourhood.flourishing?
    result
  end
end
