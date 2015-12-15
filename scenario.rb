class Scenario
  attr_reader :evaluation, :population, :state

  def initialize state_description, population
    @state= State.from state_description
    @population= population
    @evaluation= @state
  end

end