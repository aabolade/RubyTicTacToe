require './lib/human'
require './lib/computer'
require './lib/board'
require './lib/interface'

class Game

  attr_reader :board, :player_1, :player_2, :interface

  def initialize(players, interface, board = Board)
    @board = board.new
    @interface = interface
    @player_1 = players[:player_1_type].new(players[:player_1_id], @board, interface)
    @player_2 = players[:player_2_type].new(players[:player_2_id], @board, interface)
  end

  def play_game
    puts display_board
    puts "Enter [0-8]:"
    run_game
    puts display_message_for_end_of_game
  end

  def run_game
    until game_over_or_tie
      get_move_for(player_1)
      get_move_for_second_player_unless_game_is_over
    end
  end

  def get_move_for_second_player_unless_game_is_over
    if game_not_over?
      get_move_for(player_2)
    end
  end

  def get_move_for(player)
    puts "player #{player.id}'s turn'"
    player.get_move
    puts display_board
  end

  def game_not_over?
    !board.is_winner && !board.is_tie
  end

  def game_over_or_tie
    board.is_winner || board.is_tie
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

end
