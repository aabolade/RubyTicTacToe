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

  def available_spaces
    available_spaces = []
    spaces.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    available_spaces
  end

  def is_winner
    [spaces[0], spaces[1], spaces[2]].uniq.length == 1 ||
    [spaces[3], spaces[4], spaces[5]].uniq.length == 1 ||
    [spaces[6], spaces[7], spaces[8]].uniq.length == 1 ||
    [spaces[0], spaces[3], spaces[6]].uniq.length == 1 ||
    [spaces[1], spaces[4], spaces[7]].uniq.length == 1 ||
    [spaces[2], spaces[5], spaces[8]].uniq.length == 1 ||
    [spaces[0], spaces[4], spaces[8]].uniq.length == 1 ||
    [spaces[2], spaces[4], spaces[6]].uniq.length == 1
  end

  def display
    "#{@spaces[0]} | #{@spaces[1]} | #{@spaces[2]} \n===+===+===\n #{@spaces[3]} | #{@spaces[4]} | #{@spaces[5]} \n===+===+===\n #{@spaces[6]} | #{@spaces[7]} | #{@spaces[8]} \n"
  end

end
