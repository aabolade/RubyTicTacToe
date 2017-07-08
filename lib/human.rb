class Human

  attr_reader :interface, :board, :id

  def initialize(interface, board, id)
    @interface = interface
    @id = id
    @board = board
  end

  def get_move
    spot = nil
    until spot
      input = get_user_input
      if is_invalid(input)
        puts "the following input is invalid please try again"
        redo
      end
      if is_unavailable(input.to_i)
        puts "Please select another position"
        redo
      end
      spot = input.to_i
      assign_to_board(spot)
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
