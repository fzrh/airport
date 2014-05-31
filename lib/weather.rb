module Weather

	def weather_condition
		random_number = Random.new
		if (random_number.rand(1..9)) == 1.upto(7)
			weather = 'stormy'
		else (random_number.rand(1..9)) == (8 or 9)
			weather = 'sunny'
		end
	end

end