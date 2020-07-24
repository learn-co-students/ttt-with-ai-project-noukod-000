class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [6, 4, 2]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    turn_count.odd? ? player_2 : player_1
  end

  def turn_count
    @board.turn_count
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all?{|cell| @board.cells[cell] == "X"} || win_combination.all?{|cell| @board.cells[cell] == "O"}
        return win_combination
      end
    end
    false
  end

  def draw?
    if @board.full?
      if !won?
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def over?
    draw? || won?
  end

  def winner
    won? ? @board.cells[won?[0]] : nil
  end

  def turn
    puts "Please choose your move between 1-9"
    position = current_player.move @board
    if @board.valid_move? position
      @board.update(position, current_player)
      @board.display
    else
      turn
    end
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def self.start
    game = Game.new
    game.play
  end
end
