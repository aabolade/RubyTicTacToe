class Interface

  attr_reader :game_type

  def initialize
    @game_type
  end

  def ask_user_input
    game_selected = nil
    until game_selected
      puts "choose the game type:"
      game_options
      game_selected = valid_game_selected
    end
    select_game_for_user
  end

  def select_game_for_user
    case @game_type
    when "1"
      human_human
    when "2"
      computer_computer
    when "3"
      human_computer
    end
  end

  def valid_game_selected
    @game_type = get_user_input
    @game_type == "1"|| @game_type == "2"|| @game_type == "3"
  end

  def human_human
  end

  def computer_computer
  end

  def human_computer
  end


  def game_options
    puts "1. human vs human"
    puts "2. computer vs computer"
    puts "3. human vs computer"
  end

  def get_user_input
    $stdin.gets.chomp
  end

  def start
    game.run_game
  end

  def validate(input)
    input.to_i.to_s != input || input.to_i < 0
  end

end
