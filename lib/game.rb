require './lib/human'
require './lib/computer'
require './lib/board'
require './lib/interface'

class Game

  attr_reader :board, :player_1, :player_2, :interface

  def initialize(player_1 = Human, player_2 = Computer)
    @board = Board.new
    @interface = Interface.new
    @player_1 = player_1.new(@interface, @board, "O")
    @player_2 = player_2.new("X", @board)
  end

  def play_game
    puts display_board
    puts "Enter [0-8]:"
    run_game
    puts display_message_for_end_of_game
  end

  def get_move_for(player)
    player.get_move
  end

  def run_game
    until game_over_or_tie
      get_move_for(player_1)
      get_move_for_second_player_unless_game_is_over
      puts display_board
    end
  end

  def game_over_or_tie
    board.is_winner || board.is_tie
  end

  def get_move_for_second_player_unless_game_is_over
    if game_not_over?
      get_move_for(player_2)
    end
  end

  def game_not_over?
    !board.is_winner && !board.is_tie
  end

  def display_board
    board.display
  end

  def display_message_for_end_of_game
    "Game over"
  end

  def is_invalid_user_input(input)
    interface.validate(input)
  end

  def asks_player_for_input
    "Please select another position"
  end

  def game_is_over(b)
    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1
  end

  def tie(b)
    b.all? { |s| s == "X" || s == "O" }
  end

end
