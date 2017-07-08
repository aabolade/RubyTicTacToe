class Computer

  attr_reader :id, :board

  def initialize(id, board)
    @id = id
    @board = board
  end

  def get_move

  end

  def eval_board
    spot = nil
    until spot
      if centre_grid_empty
        spot = 4
        assign_spot(spot, @com)
      else
        spot = get_best_move(@board, @com)
        assign_spot_if_space_free(spot,@com)
      end
    end
  end
end
