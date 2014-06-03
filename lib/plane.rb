class Plane

	def initialize(status='flying')
		@status = status
	end

	def status?
		@status
	end

	def take_off!
		#raise 'You are already in the air!' if status? 'flying'
		@status = 'flying'
		self
	end

	def land!
		@status = 'landed'
		self
	end


end