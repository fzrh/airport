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

  def gives_permission_to_land_to plane
  	raise RuntimeError if full?
  	raise RuntimeError if weather_condition == 'stormy'
  	hangar << plane
  end

  def gives_permission_to_take_off_to plane
  	raise RuntimeError if weather_condition == 'stormy'
  	@hangar
  end

  def full?
  	planes_count == capacity
  end

end