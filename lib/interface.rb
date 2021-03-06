require './lib/human'
require './lib/computer'
require './lib/game'

class Interface

  attr_reader :game_type, :symbol
  attr_accessor :user_is_first

  def initialize
    @game_type
    @symbol
    @user_is_first
  end

  def present_game_options
    game_selected = nil
    until game_selected
      puts "choose the game type:"
      game_options
      game_selected = valid_game_selected
    end
  end

  def create_game_players
    case @game_type
    when "1"
      human_human
    when "2"
      computer_computer
    when "3"
      human_computer
    end
  end

  def human_human
    setup_game_preferences
    setup_players(Human,Human)
  end

  def computer_computer
     setup_players(Computer, Computer)
  end

  def human_computer
    setup_game_preferences
    setup_players(Human, Computer)
  end

  def setup_game_preferences
    select_symbol
    select_player_order
  end

  def select_symbol
    symbol_chosen = nil
    until symbol_chosen
      puts "choose your symbol"
      symbol_options
      symbol_chosen = valid_symbol_selected
    end
  end

  def select_player_order
    order_chosen = nil
    until order_chosen
      puts "would you like to go first"
      player_order_options
      order_chosen = valid_order_selected
    end
  end

  def setup_players(player_1, player_2)
    players = make_game_players(player_1, player_2)
    if user_does_not_go_first
      players = players.reverse
    else
      players
    end
  end

  def create_game(players, game = Game)
    game = game.new(players.first, players.last, self)
    game.play_game
  end

  def valid_game_selected
    set_game_type
    @game_type == "1"|| @game_type == "2"|| @game_type == "3"
  end

  def valid_symbol_selected
    set_symbol
    @symbol == "X" || @symbol == "O"
  end

  def valid_order_selected
    set_game_order
    @user_is_first == "Y" || @user_is_first == "N"
  end

  def set_game_type
    @game_type = get_user_input
  end

  def set_symbol
    @symbol = get_user_input.upcase
  end

  def set_game_order
    @user_is_first = get_user_input
  end

  def user_does_not_go_first
    @user_is_first == "N"
  end

  def validate(input)
    input.to_i.to_s != input || input.to_i < 0
  end

  private

  def make_game_players(player_1, player_2)
    [{type: player_1, id: get_player_1_symbol}, {type: player_2, id: get_player_2_symbol}]
  end

  def get_player_1_symbol
    symbol ? symbol : "X"
  end

  def get_player_2_symbol
    get_player_1_symbol == "X" ? "O": "X"
  end

  def game_options
    puts "1. human vs human"
    puts "2. computer vs computer"
    puts "3. human vs computer"
  end

  def symbol_options
    puts "select 'X' or 'O' "
  end

  def player_order_options
    puts "select 'Y' or 'N' "
  end

  def get_user_input
    $stdin.gets.chomp
  end

end
