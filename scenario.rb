class Scenario
  attr_reader  :population, :state

  def initialize state_description, population
    @state= State.from state_description
    @population= population
    @evaluation= @state
  end

  def evaluation
    @evaluation.to_sym
  end

  def apply rule
    evaluated = rule.evaluate(@state,@population)
    @evaluation = evaluated unless evaluated.nil?
  end
end