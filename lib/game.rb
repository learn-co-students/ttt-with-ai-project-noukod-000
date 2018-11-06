require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), bd = Board.new)
    @board = bd
    @player_1 = p1
    @player_2 = p2
  end

    # Define your WIN_COMBINATIONS constant
   WIN_COMBINATIONS = [
     [0,1,2], # Top row
     [3,4,5],  # Middle row
     [6,7,8], # Bottom row
     [0,3,6],  # Middle row
     [1,4,7], # Top row
     [2,5,8],  # Middle row
     [0,4,8], # Top row
     [2,4,6]  # Middle row
     # ETC, an array for each win combination
   ]

  def current_player
    self.board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def turn
    puts "Please enter 1-9:"
    player = self.current_player
    input = player.move(self.board)
    # index = input_to_index(input)
    if self.board.valid_move?(input)
      self.board.update(input, player)
      self.board.display
    else
      self.turn
    end
  end

  def start
    # Player.reset_all
    self.play
  end

  def won?
    WIN_COMBINATIONS.detect{|case_set| case_set.all?{|case_i| self.board.position((case_i+1).to_s) == "X"} || case_set.all?{|case_i| self.board.position((case_i+1).to_s) == "O"} }
  end

  def winner
    winner_i = self.over? ? self.board.position((self.won?[0]+1).to_s) : nil
  end

  def play
    until self.over?
      self.turn
    end

    if self.draw?
      puts "Cat's Game!"
    elsif WIN_COMBINATIONS.include?(self.won?)
      puts "Congratulations #{winner}!"
    end
  end

  def draw?
    self.board.full? && !WIN_COMBINATIONS.include?(self.won?)
  end

  def over?
    self.won? || self.draw?
  end
end
