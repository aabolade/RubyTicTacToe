class Human < Player

  attr_reader :interface

  def get_move
    input = get_user_input
    
  end

  def get_user_input
    gets.chomp
  end

  def is_invalid(input)
    interface.validate(input)
  end
end
