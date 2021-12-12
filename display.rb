module Display
  TOP_LEFT = "\u2554"
  TOP_RIGHT = "\u2557"
  BOTTOM_LEFT = "\u255a"
  BOTTOM_RIGHT = "\u255d"
  HOR = "\u2550"
  VER = "\u2551"
  T_DOWN = "\u2566"
  T_UP = "\u2569"
  T_RIGHT = "\u2560"
  T_LEFT = "\u2563"
  T_ALL = "\u256c"

  def top_row
    TOP_LEFT + HOR * 3 + T_DOWN + HOR * 3 + T_DOWN + HOR * 3 + T_DOWN + HOR * 3 + T_DOWN + HOR * 3 + T_DOWN + HOR * 3 + T_DOWN + HOR * 3 + TOP_RIGHT
  end
  
  def middle_row
    T_RIGHT + HOR * 3 + T_ALL + HOR * 3 + T_ALL + HOR * 3 + T_ALL + HOR * 3 + T_ALL + HOR * 3 + T_ALL + HOR * 3 + T_ALL + HOR * 3 + T_LEFT
  end

  def number_row
    VER + (0..6).map{ |i| ' ' + i.to_s.green + ' '}.join(VER) + VER
  end
  
  def bottom_row
    BOTTOM_LEFT + HOR * 3 + T_UP + HOR * 3 + T_UP + HOR * 3 + T_UP + HOR * 3 + T_UP + HOR * 3 + T_UP + HOR * 3 + T_UP + HOR * 3 + BOTTOM_RIGHT
  end

  def piece_hash
    {
      0 => "\u25ef",
      1 => "\u25CF".red,
      2 => "\u25CF".yellow
    }
  end
  
  def draw_board(board)
    game_rows = board.map do |row|
      VER + (0..6).map{ |i|' ' + piece_hash[row[i]] + ' '}.join(VER) + VER
    end.join("\n" + middle_row + "\n")
    top_row + "\n" + game_rows + "\n" + middle_row + "\n" + number_row + "\n" + bottom_row
  end

  def clear_screen
    system('clear') || system('cls')
  end
end
