class Scenario
  attr_reader :evaluation, :population, :state
  def initialize state, population
    @state= state
    @population= population
    @evaluation= state
  end
end