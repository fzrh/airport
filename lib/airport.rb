class Airport

  DEFAULT_CAPACITY = 25

  attr_accessor :capacity

  def initialize(options ={})  
    @capacity = options[:capacity] || DEFAULT_CAPACITY
  end

  def hangar
    @hangar ||= []
  end

  def gives_permission_to_land_to(plane)
  	hangar << plane
  end

end