require_relative 'display.rb'

class GameBoard
  include Display
  ROW = 6
  COL = 7

  attr_reader :board

  def initialize(board: Array.new(ROW) {Array.new(COL) {0}})
    @board = board
  end

  def update_board(col, piece)
    (ROW-1).downto(0) do |r|
      next if @board[r][col] != 0
      @board[r][col] = piece
      break
    end
  end

  def check_win(piece)
    # check horizontal
    (0...COL-3).each do |c|
      (0...ROW).each do |r|
        if @board[r][c] == piece && @board[r][c+1] == piece && @board[r][c+2] == piece && @board[r][c+3] == piece
          return true
        end
      end
    end
  
    # check vertical
    (0...COL).each do |c|
      (0...ROW-3).each do |r|
        if @board[r][c] == piece && @board[r+1][c] == piece && @board[r+2][c] == piece && @board[r+3][c] == piece        
          return true
        end
      end
    end
    
    # check right diagonal
    (0...COL-3).each do |c|
      (0...ROW-3).each do |r|
        if @board[r][c] == piece && @board[r+1][c+1] == piece && @board[r+2][c+2] == piece && @board[r+3][c+3] == piece
          return true
        end
      end
    end
    
    # check left diagonal
    (3...COL).each do |c|
      (0...ROW-3).each do |r|
        if @board[r][c] == piece && @board[r+1][c-1] == piece && @board[r+2][c-2] == piece && @board[r+3][c-3] == piece
          return true
        end
      end
    end
    false
  end

  def check_draw
    return true if @board.flatten.all?{|x| x != 0}
    false
  end

  def to_s
    draw_board(@board)
  end
end