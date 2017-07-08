require './lib/human'
require './lib/computer'
require './lib/board'
require './lib/interface'

class Game

  attr_reader :board, :com, :hum, :player_1, :player_2, :interface

  def initialize(player_1 = Human, player_2 = Computer)
    board = Board.new
    @board = board.spaces
    @interface = Interface.new
    @player_1 = player_1.new(@interface, @board, "X")
    @player_2 = player_2.new("O")

    @com = "X" # the computer's marker
    @hum = "O" # the user's marker
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
    until game_is_over(@board) || tie(@board)
      #get_human_spot
      get_move_for(player_1)
      evalute_board_if_game_is_not_finished
      puts display_board
    end
  end

  def evalute_board_if_game_is_not_finished
    if game_not_over?
      eval_board
    end
  end

  def game_not_over?
    !game_is_over(@board) && !tie(@board)
  end

  def display_board
    "#{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
  end

  def display_message_for_end_of_game
    "Game over"
  end

  def get_human_spot
    spot = nil
    until spot
      spot_as_string = get_user_input
      if is_invalid_user_input(spot_as_string)
        puts "the following input is invalid please try again"
        redo
      end
      if spot_is_out_of_bounds(spot_as_string.to_i)
        puts asks_player_for_input
        redo
      end
      spot = spot_as_string.to_i
      assign_spot_if_space_free(spot,@hum)
    end
  end

  def get_user_input
    gets.chomp
  end

  def is_invalid_user_input(input)
    interface.validate(input)
  end

  def assign_spot_if_space_free(spot, player)
    if board_space_is_free(spot)
      assign_spot(spot, player)
    else
      spot = nil
    end
  end

  def spot_is_out_of_bounds(spot)
    maximum_index = @board.count - 1
    spot.to_i > maximum_index
  end

  def asks_player_for_input
    "Please select another position"
  end

  def board_space_is_free(spot)
    @board[spot] != "X" && @board[spot] != "O"
  end

  def assign_spot(spot, player)
    @board[spot] = player
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

  def centre_grid_empty
     @board[4] == "4"
  end

  def get_best_move(board, depth = 0, best_score = {})
    available_spaces = collect_available_spots
    available_spaces.each do |as|
      board[as.to_i] = @com
      if game_is_over(board)
        return current_spot_as_best_move(as)
      else
        board[as.to_i] = @hum
        if game_is_over(board)
          return current_spot_as_best_move(as)
        else
          board[as.to_i] = as
        end
      end
    end
    get_random_spot_from(available_spaces)
  end

  def current_spot_as_best_move(spot)
    best_move = spot.to_i
    board[spot.to_i] = spot
    best_move
  end

  def collect_available_spots
    available_spaces = []
    board.each do |s|
      if s != "X" && s != "O"
        available_spaces << s
      end
    end
    available_spaces
  end

  def get_random_spot_from(available_spaces)
    n = rand(0...available_spaces.count)
    available_spaces[n].to_i
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
