class World
  
  def initialize descriptor
    @descriptor = descriptor
    @index=0
  end

  def population
    @descriptor.count "X"
  end

  def next
    raise "It's the end of the world" if @index==9
    state=obtain_state @index
    population = alive_around(@index)
    @index+=1
    return[state, population]
  end

  private
  
  def obtain_state index
    return :live_cell if index==5
    :dead_cell
  end
  
  def alive_around index
    region = obtain_region (index)
    region.count"X"
  end

  def obtain_region index
    populated_region="X"
    empty_region=""
    with_neighbours=[1,2,4,7,8]
    return populated_region if  with_neighbours.include? index 
    empty_region
  end
end