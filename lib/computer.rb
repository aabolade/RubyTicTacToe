class Computer

  attr_reader :id, :board

  def initialize(id, board, interface)
    @id = id
    @board = board
  end

  def get_move
    spot = nil
    until spot
      spot = get_best_move
    end
    assign_id_to_spot(spot, self.id)
  end

  def get_best_move
    available_spaces = get_available_spaces
    available_spaces.each do |space|
      assign_id_to_spot(space.to_i, id)
      return reset_and_return_move(space) if game_is_over?
      reset_spot_to_empty_space(space)
    end
    get_random_spot_from(available_spaces)
  end

  def get_random_spot_from(available_spaces)
    n = rand(0...available_spaces.count)
    available_spaces[n].to_i
  end

  def get_available_spaces
    board.available_spaces
  end

  private

  def assign_id_to_spot(spot,id)
    board.assign_to_space(spot, id)
  end

  def reset_and_return_move(spot)
    reset_spot_to_empty_space(spot)
    best_move = spot.to_i
  end

  def reset_spot_to_empty_space(spot)
    board.assign_to_space(spot.to_i,spot)
  end

  def game_is_over?
    board.is_winner?
  end

end
