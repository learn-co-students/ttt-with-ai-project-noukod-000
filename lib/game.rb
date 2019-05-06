class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
      [0,1,2],
      [3,4,5],
      [6,7,8],
      [2,4,6],
      [0,4,8],
      [0,3,6],
      [1,4,7],
      [2,5,8]
]

  def initialize(play_1 = Players::Human.new("X"), play_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = play_1
    @player_2 =  play_2
    @board = board
  end
  
  def current_player
    if board.turn_count.even?
      player_1
    else
      player_2
    end
  end
  
   def won?
    WIN_COMBINATIONS.each {|win_combo|
      position_1 = board.cells[win_combo[0]]
      position_2 = board.cells[win_combo[1]]
      position_3 = board.cells[win_combo[2]]

      return win_combo if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
    }
    return false
  end

  def full?
    turn_count == 9
  end

  def draw?
    if !won? && board.full?
      true
    else
      false
    end
  end

  def over?
    won? || draw?
  end

  def winner
    board.cells[won?[0]] if won?
  end

  def play
    until over?
      turn
    end

    if won?
      winner = winner()
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
  def valid_move?(input)
    input.between?(0, 8) && !taken?(input)
  end
  
  def turn
    input = current_player.move board
    if !board.valid_move? input
      turn
    else
      puts "Turn: #{@board.turn_count+1}"
      puts "Player #{current_player} move to position #{input}"
      board.update input, current_player
      board.display
    end
  end
  
end