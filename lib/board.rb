class Board

  attr_reader :spaces

  def initialize
    @spaces = ["0","1","2","3","4","5","6","7","8"]
  end

  def is_available(spot)
    return false if spot_is_out_of_bounds(spot)
    @spaces[spot] != "X" && @spaces[spot] != "O"
  end

  def spot_is_out_of_bounds(spot)
    maximum_index = @spaces.count - 1
    spot.to_i > maximum_index
  end

  def assign_to_space(spot, player)
    @spaces[spot] = player
  end

end
