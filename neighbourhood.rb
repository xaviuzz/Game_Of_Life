class Neighbourhood
	def initialize live_neighbours
		@live_neighbours = live_neighbours
	end

	def healthy?
  		@live_neighbours == 2 or @live_neighbours == 3
  	end
end