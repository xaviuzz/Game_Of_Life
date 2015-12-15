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
      rule.apply scenario
    end
  end
end
