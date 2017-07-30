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
      spot = input_to_move
    end
    assign_to_board(spot)
  end

  def input_to_move
    input = get_user_input
    validate(input)
    return input if valid?(input)
  end

  private

  def valid?(input)
    !is_invalid?(input) && !is_unavailable?(input)
  end

  def validate(input)
    if is_invalid?(input)
      puts "the following input is invalid please try again"
    elsif is_unavailable?(input)
      puts "Please select another position"
    end
  end

  def assign_to_board(spot)
    board.assign_to_space(spot,self.id)
  end

  def get_user_input
    gets.chomp
  end

  def is_unavailable?(spot)
    !board.is_available(spot)
  end

  def is_invalid?(input)
    interface.validate(input)
  end
end
