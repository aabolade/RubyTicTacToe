class Computer

  attr_reader :id, :board

  def initialize(id, board)
    @id = id
    @board = board
  end

  def get_move

  end

  def centre_grid_is_empty
    board.centre_grid_is_empty
  end

  def get_opponent_id
    id == "X" ? "O" : "X"
  end

  def get_best_move(board)
    available_spaces = board.available_spaces
    available_spaces.each do |as|
      board.spaces[as.to_i] = id
      if game_is_over
        return current_spot_as_best_move(as)
      else
        board[as.to_i] = get_opponent_id
        if game_is_over(board)
          return current_spot_as_best_move(as)
        else
          board[as.to_i] = as
        end
      end
    end
    get_random_spot_from(available_spaces)
  end

  def find_spot_for_opponent_win(spot)
    board[spot.to_i] = get_opponent_id
    if game_is_over(board)
      return current_spot_as_best_move(as)
    else
      board[as.to_i] = as
    end
  end

  def current_spot_as_best_move(spot)
    best_move = spot.to_i
    board[spot.to_i] = spot
    best_move
  end

  def game_is_over
    board.is_winner
  end

  def get_random_spot_from(available_spaces)
    n = rand(0...available_spaces.count)
    available_spaces[n].to_i
  end

  def eval_board
    spot = nil
    until spot
      if centre_grid_is_empty
        spot = 4
        board.assign_to_space(spot, self.id)
      else
        spot = get_best_move(@board, @com)
        assign_spot_if_space_free(spot,@com)
      end
    end
  end
end
