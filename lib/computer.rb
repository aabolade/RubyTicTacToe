class Computer

  attr_reader :id, :board

  CENTRE_INDEX = 4

  def initialize(id, board, interface)
    @id = id
    @board = board
  end

  def get_move
    spot = nil
    until spot
      spot = centre_or_best_spot
    end
    board.assign_to_space(spot, self.id)
  end

  def centre_or_best_spot
    return CENTRE_INDEX if centre_grid_is_empty
    get_best_move
  end

  def get_best_move
    available_spaces = get_available_spaces
    available_spaces.each do |space|
      assign_id_to_spot(space.to_i, id)
      return reset_and_return_move(space) if game_is_over
      assign_opponent_id_to_spot(space.to_i, get_opponent_id)
      return reset_and_return_move(space) if game_is_over
      reset_spot_to_empty_space(space)
    end
    get_random_spot_from(available_spaces)
  end

  def centre_grid_is_empty
    board.centre_grid_is_empty
  end

  def get_opponent_id
    id == "X" ? "O" : "X"
  end

  def assign_id_to_spot(spot,id)
    board.assign_to_space(spot, id)
  end

  def assign_opponent_id_to_spot(spot,id)
    board.assign_to_space(spot,id)
  end

  def reset_and_return_move(spot)
    reset_spot_to_empty_space(spot)
    best_move = spot.to_i
  end

  def reset_spot_to_empty_space(spot)
    board.assign_to_space(spot.to_i,spot)
  end

  def game_is_over
    board.is_winner
  end

  def get_random_spot_from(available_spaces)
    n = rand(0...available_spaces.count)
    available_spaces[n].to_i
  end

  def get_available_spaces
    board.available_spaces
  end

end
