class Neighbourhood
	def initialize live_neighbours
		@live_neighbours = live_neighbours
	end

	def healthy?
		@live_neighbours == 2 or @live_neighbours == 3
	end

  def flourishing?
    @live_neighbours == 3
  end

  def overcrowded?
    @live_neighbours > 3
  end

  def underpopulated?
    @live_neighbours < 2
  end

end