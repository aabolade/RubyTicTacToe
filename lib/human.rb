class Human

  attr_reader :interface, :board, :id

  def initialize(id, board, interface)
    @id = id
    @board = board
    @interface = interface
  end

  def get_move
    spot = nil
    until spot
      input = get_user_input
      validate(input)
      if valid(input)
        spot = input.to_i
      end
    end
    assign_to_board(spot)
  end

  private

  def valid(input)
    !is_invalid(input) && !is_unavailable(input.to_i)
  end

  def validate(input)
    if is_invalid(input)
      puts "the following input is invalid please try again"
    elsif is_unavailable(input.to_i)
      puts "Please select another position"
    end
  end

  def assign_to_board(spot)
    board.assign_to_space(spot,self.id)
  end

  def get_user_input
    gets.chomp
  end

  def is_unavailable(spot)
    !board.is_available(spot)
  end

  def is_invalid(input)
    interface.validate(input)
  end
end
