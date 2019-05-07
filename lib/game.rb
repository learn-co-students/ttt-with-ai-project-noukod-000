class Game
  
  attr_accessor :board, :player_1, :player_2
  
     WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]
  
 def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
  @player_1 = player_1
  @player_2 = player_2
  @board = board
  # binding.pry
  end
  
  def current_player
    self.board.turn_count % 2 == 0? self.player_1: self.player_2
  end
  
   def won?
    WIN_COMBINATIONS.detect do |a|
      @board.cells[a[0]] == @board.cells[a[1]] &&
      @board.cells[a[1]] == @board.cells[a[2]] &&
      @board.taken?(a[0]+1)
    end
  end
  
  def draw?
    self.board.turn_count == 9 && !won?
  end
  
  def over?
    self.draw? || self.won?
  end
  
   def winner
    self.won? ? self.board.cells[self.won?[0]]:nil
  end
  

  def turn
    player = current_player
    current_move = player.move(board.dup.freeze)

    unless board.valid_move?(current_move)
      puts "Invalid move. Please try again."
      turn
    else
      puts "Turn: #{board.turn_count + 1}"
      board.update(current_move, player)
      puts "#{player.token} moved #{current_move}"
      puts
      board.display
      puts
    end
  end

   def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif
      puts "Cat's Game!"
    end
  end
  
end