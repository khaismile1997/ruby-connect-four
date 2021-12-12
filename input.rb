module Input
  def msg_hash(name = nil)
    {
      ready: "Are you ready? (y or n): ",
      name1: "Please input name of player 1: ",
      name2: "Please input name of player 2: ",
      turn: "\n#{name}'s turn, please enter the number of columns you want to drop: \n",
      win:   "\nCongratulations, player #{name} WON!!!".green,
      draw:  "\nCongratulations to both great players. DRAW!".green,
      continue: "Would you like to play a new game? (y or n): ",
      bye:   "Thanks for playing! Goodbye."
    }
  end

  def introduce
    <<~HEREDOC
      #{'Welcome to Connect Four!'.bold.underline.italic}
      Wiki guide: https://en.wikipedia.org/wiki/Connect_Four

      #{"Connect Four".bold.blue} is a two-player connection board game, in which the players choose a color and
      then #{"take turns dropping colored discs into a seven-column, six-row".italic.bold.blue} vertically suspended grid.

      #{"The pieces".italic.bold.cyan} fall straight down, occupying the lowest available space within the column.
      #{"The objective".italic.bold.red} of the game is to be the first to form a #{"horizontal".yellow}, #{"vertical".yellow}, or #{"diagonal".yellow} line
      of four of one's own discs.

      Below is a sample game:

      #{'Gameplay:'.bold.underline}
      #{GameBoard.new(board: [[0,0,0,0,0,0,0],
                              [0,0,0,0,0,0,0],
                              [1,1,0,0,2,0,0],
                              [2,2,1,1,1,1,0],
                              [2,2,1,2,2,2,1],
                              [1,1,2,1,2,1,2]])}

      #{'NOTE:'.bold}
      Connect Four is a solved game. The first player can always win by playing the right moves.

    HEREDOC
  end

  def yes_no(msg)
    print msg
    ans = gets.chomp[0]
    ans.downcase!
    
    until %w(y n).include? ans
      puts "Please enter 'y' or 'n'."
      print msg
      ans = gets.chomp[0]
      ans.downcase!
    end
    ans
  end

  def input_name(msg)
    print msg
    name = gets.chomp
    until name != ""
      puts "The name is not blank!!!"
      print msg
      name = gets.chomp
    end
    name
  end
  
  def input_number_in_range(msg, range, board)
    print msg
    num = gets.chomp
    until num != "" && range.include?(num.to_i) && board.any? {|r| r[num.to_i] == 0}
      puts "Number #{'not blank'.red} and must #{'between'.red} #{range.first.to_s.red} #{'&'.red} #{range.last.to_s.red}, inclusive"
      puts "and the Number's column must #{'not be full'.red}"
      print msg
      num = gets.chomp
    end
    num.to_i
  end
end