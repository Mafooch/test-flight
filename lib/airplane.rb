class Airplane
  attr_reader :type, :wing_loading, :horsepower, :started, :flying, :fuel

  def initialize(type, wing_loading, horsepower)
    @type = type
    @wing_loading = wing_loading
    @horsepower = horsepower
    @started = false
    @flying = false
    @fuel = 5
  end

  def start
    if @started
      "airplane already started"
    else
      if @fuel <= 1
        not_enough_fuel
      else
        @started = true
        "airplane started"
      end
    end
  end

  def takeoff
    if @started == false
      "airplane not started, please start"
    else
      if @fuel <= 1
        not_enough_fuel
      else
        @flying = true
        "airplane launched"
      end
    end
  end

  def land
    if @started
      if @flying
        if @fuel <= 1
          not_enough_fuel
        else
          @flying = false
          "airplane landed"
        end
      else
        "airplane already on the ground"
      end
    else
      "airplane not started, please start"
    end
  end

  def not_enough_fuel
    "You don't have enough fuel!"
  end

end

# my_plane = Airplane.new("cesna", 10, 150)
