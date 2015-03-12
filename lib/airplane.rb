class Airplane
  attr_reader :type, :wing_loading, :horsepower, :started, :flying

  def initialize(type, wing_loading, horsepower)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @started = false
    @flying = false
  end

  def start
    if @started
      "airplane already started"
    else
      @started = true
      "airplane started"
    end
  end

  def takeoff
    if @started == false
      "airplane not started, please start"
    else
      @flying = true
      "airplane launched"
    end
  end

  def land
    if @started
      if @flying
        @flying = false
        "airplane landed"
      else
        "airplane already on the ground"
      end
    else
      "airplane not started, please start"
    end
  end

end

# my_plane = Airplane.new("cesna", 10, 150)
