require_relative 'read_txt.rb'
require_relative 'input.rb'
require_relative 'display.rb'

class Game
  include ReadTxt
  include Display
  include Input

  attr_accessor :turn

  def initialize
    clear_screen
    puts img_file("title.txt").green
    puts introduce
  end

  def play_game
    playing = yes_no(msg_hash[:ready]) == 'y'
    while playing
      clear_screen
      new_game
      playing = continue?(msg_hash[:continue])
    end
    puts msg_hash[:bye]
  end

  def new_game
    game_setup
    @game_board = GameBoard.new
    next_turn until game_over?
    clear_stdin
    puts @game_board
    puts game_over?
  end

  def game_setup
    name1 = input_name(msg_hash[:name1])
    @player1 = Player.new(name: name1, piece: 1)
    name2 = input_name(msg_hash[:name2])
    @player2 = Player.new(name: name2, piece: 2)
    @turn_name = @player1.name
    @piece = @player1.piece
    self.turn = 0
    clear_screen
  end
  
  def next_turn
    clear_screen
    self.turn += 1
    puts @game_board
    col = input_number_in_range(msg_hash(@turn_name)[:turn], (0..6).to_a, @game_board.board)
    @game_board.update_board(col, @piece)
  end
  
  def game_over?
    return msg_hash(@turn_name)[:win] if @game_board.check_win(@piece)
    return msg_hash[:draw] if @game_board.check_draw
    swap_turn if self.turn != 0
    false
  end

  def swap_turn
    @turn_name = @turn_name == @player1.name ? @player2.name : @player1.name
    @piece = @piece == @player1.piece ? @player2.piece : @player1.piece
  end
  
  def continue?(msg)
    yes_no(msg) == 'y'
  end

  def clear_stdin
    $stdin.getc while $stdin.ready?
  end
end