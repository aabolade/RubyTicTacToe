require './lib/interface'

interface = Interface.new
interface.present_game_options
players = interface.create_game_players
interface.create_game(players)
