class Scenario
  attr_reader :state, :neighbourhood

  def initialize state_descriptor, live_neighbours
  	@resolved = false
    @state = State.create(state_descriptor)
    @neighbourhood = Neighbourhood.new(live_neighbours)    
  end

  def resolve new_state
  	@state = new_state
  	@resolved = true
  end

  def resolved?
  	@resolved
  end
end