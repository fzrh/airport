class Plane

	def initialize(status='flying')
		@status = status
	end

	def status?
		@status
	end

	def take_off!
		@status = 'flying'
		self
	end

	def landed!
		@status = 'landed'
		self
	end


end