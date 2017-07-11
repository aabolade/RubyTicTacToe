class Computer

  attr_reader :id, :board

  def initialize(id, board)
    @id = id
    @board = board
  end

  def centre_grid_is_empty
    board.centre_grid_is_empty
  end

  def get_opponent_id
    id == "X" ? "O" : "X"
  end

  def get_best_move
    available_spaces = get_available_spaces
    available_spaces.each do |as|
      assign_id_to_spot(as.to_i, id)
      return reset_and_return_move(as) if game_is_over
      assign_opponent_id_to_spot(as.to_i, get_opponent_id)
      return reset_and_return_move(as) if game_is_over
      reset_spot_to_empty_space(as)
    end
    get_random_spot_from(available_spaces)
  end

  def assign_id_to_spot(spot,id)
    board.assign_to_space(spot, id)
  end

  def assign_opponent_id_to_spot(spot,id)
    board.assign_to_space(spot,id)
  end

  def reset_spot_to_empty_space(spot)
    board.assign_to_space(spot.to_i,spot)
  end

  def reset_and_return_move(spot)
    reset_spot_to_empty_space(spot)
    best_move = spot.to_i
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

  def get_move
    spot = nil
    until spot
      if centre_grid_is_empty
        spot = 4
        board.assign_to_space(spot, self.id)
      else
        spot = get_best_move
        board.assign_to_space(spot,self.id)
      end
    end
  end
end
