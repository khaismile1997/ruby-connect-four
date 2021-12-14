# frozen_string_literal: true

require_relative 'display'

class GameBoard
  include Display
  ROW = 6
  COL = 7

  attr_accessor :board

  def initialize(board: Array.new(ROW) { Array.new(COL) { 0 } })
    @board = board
  end

  def update_board(col, piece)
    (ROW - 1).downto(0) do |r|
      next if @board[r][col] != 0

      @board[r][col] = piece
      break
    end
  end

  def check_win(piece)
    return true if [
      check_horizontal(piece),
      check_vertical(piece),
      check_diagonal(piece)
    ].any?

    false
  end

  def check_horizontal(piece)
    (0...COL - 3).each do |c|
      (0...ROW).each do |r|
        return true if @board[r][c] == piece && @board[r][c + 1] == piece && @board[r][c + 2] == piece && @board[r][c + 3] == piece
      end
    end

    false
  end

  def check_vertical(piece)
    (0...COL).each do |c|
      (0...ROW - 3).each do |r|
        return true if @board[r][c] == piece && @board[r + 1][c] == piece && @board[r + 2][c] == piece && @board[r + 3][c] == piece
      end
    end

    false
  end

  def check_diagonal(piece) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/MethodLength
    # check right diagonal
    (0...COL - 3).each do |c|
      (0...ROW - 3).each do |r|
        return true if @board[r][c] == piece && @board[r + 1][c + 1] == piece && @board[r + 2][c + 2] == piece && @board[r + 3][c + 3] == piece
      end
    end

    # check left diagonal
    (3...COL).each do |c|
      (0...ROW - 3).each do |r|
        return true if @board[r][c] == piece && @board[r + 1][c - 1] == piece && @board[r + 2][c - 2] == piece && @board[r + 3][c - 3] == piece
      end
    end

    false
  end

  def check_draw
    return true if @board.flatten.all? { |x| x != 0 }

    false
  end

  def to_s
    draw_board(@board)
  end
end
