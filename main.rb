# frozen_string_literal: true

require_relative './lib/colors'
require_relative './lib/player'
require_relative './lib/game_board'
require_relative './lib/game'

game = Game.new
game.play_game
