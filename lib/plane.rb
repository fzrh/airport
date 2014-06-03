class Plane

	def initialize
		@status = 'flying'
	end

	def status?
		@status
	end

	def take_off!
		@status = 'flying'
		self
	end

	def land!
		raise 'You are already landed!' if self.status? == 'landed'
		@status = 'landed'
		self
	end

end