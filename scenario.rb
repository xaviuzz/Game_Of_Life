class Scenario
  attr_reader  :population, :state

  def initialize state_description, population
    @state= State.from state_description
    @population= population
    @evaluation= @state
  end

  def resolve evaluation
    @evaluation= evaluation
  end
  
  def evaluation
    @evaluation.to_sym
  end
end