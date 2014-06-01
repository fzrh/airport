class Plane

	def initialize
		@flying = true
	end

	def flying?
		@flying
	end

	def flying
		@flying
	end

	def take_off
		@flying
		self
	end

	def landed
		@flying = false
		self
	end

end