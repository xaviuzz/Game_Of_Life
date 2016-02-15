class Rules
  def initialize
    @rules=[
      Flourishing.new,
      Overcrowded.new,
      Healthy.new,
      Underpopulated.new
    ]
  end

  def apply scenario
    @rules.each do |rule|
      scenario.apply rule
    end
  end
end
