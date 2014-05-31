module Weather

	def weather_condition
		random_number = Random.new
		if (random_number.rand(1..5)) == (1 or 2 or 3 or 4)
			weather = 'stormy'
		else (random_number.rand(1..5)) == 5
			weather = 'sunny'
		end
	end

end