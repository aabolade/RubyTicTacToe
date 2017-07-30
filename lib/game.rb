require './lib/human'
require './lib/computer'
require './lib/board'
require './lib/interface'

class Game

  attr_reader :board, :player_1, :player_2, :interface
  attr_accessor :current_player

  def initialize(players, interface, board = Board)
    @board = board.new
    @interface = interface
    @player_1 = players[:player_1_type].new(players[:player_1_id], @board, interface)
    @player_2 = players[:player_2_type].new(players[:player_2_id], @board, interface)
    @current_player
  end

  def play_game
    puts display_board
    puts "Enter [1-9]:"
    get_player_moves
    puts display_message_for_end_of_game
  end

  def get_player_moves
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
    self.current_player = player.id
    puts "player #{player.id}'s turn'"
    player.get_move
    puts display_board
  end

  def display_board
    board.display
  end

  def display_message_for_end_of_game
    if winner_present
      "Game over. #{current_player} is the winner"
    elsif tie_game
      "Game over. Tie!"
    end
  end

  def game_over_or_tie
    winner_present || tie_game
  end

  private

  def game_not_over?
    !winner_present && !tie_game
  end

  def winner_present
    board.is_winner
  end

  def tie_game
    board.is_tie
  end

  def is_invalid_user_input(input)
    interface.validate(input)
  end

  def asks_player_for_input
    "Please select another position"
  end

end
