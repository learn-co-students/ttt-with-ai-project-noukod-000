class Board
  attr_accessor :cells

  #the constructor method will initialize the board for the a new game.
  def initialize
    reset!
  end

  # The #reset! method can reset the state of the cells to what a board should look like at the start of a game
  def reset!
    # @cells = Array.new(9, " ")
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

# The display method will show how the board is supposed to be on the display.
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

#Position method that takes in the user's input in the form of 1-9 strings
#It returns the value of the cell on the board.
  def position(input)
    cell_index_taken = input.to_i-1
    cells[cell_index_taken]
  end

# Return full if the entire board is full with "X" or and "O"s
  def full?
    cells.all? do |cell|
      cell == "X" or cell == "O"
    end
  end

  def turn_count
    cells.count{|cell| cell == "X" || cell == "O"}
  end

  # This will return false if the position is taken
  def taken?(input)
    position(input) != "" && position(input) != " "
  end

  # This method will return true if the position is empty.
  def valid_move?(input)
    (1..9).include?(input.to_i) && !taken?(input)
  end

  def update(input, player)
    input = input.to_i - 1
    cells[input] = player.token
  end

end
