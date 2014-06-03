require_relative 'weather'

class Airport

  include Weather

  DEFAULT_CAPACITY = 10

  attr_accessor :capacity

  def initialize(options ={})  
    @capacity = options[:capacity] || DEFAULT_CAPACITY
  end

  def hangar
    @hangar ||= []
  end

  def planes_count
    hangar.count
  end

  def give_permission_to_land_to plane
  	raise 'Sorry, airport is full.' if full?
  	raise 'Sorry, permission to take off denied. The weather is stormy.' if weather_condition == 'stormy'
  	hangar << plane
    plane.land!
  end

  def give_permission_to_take_off_to plane
  	raise 'Sorry, permission to land denied. The weather is stormy.' if weather_condition == 'stormy'
  	hangar.delete(plane)
  end

  def full?
  	planes_count == capacity
  end

end