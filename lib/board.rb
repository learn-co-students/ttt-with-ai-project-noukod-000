class Board
  attr_accessor :cells
  def initialize
    reset!
  end
  def reset!
    self.cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  
  def position(input)
    cell_index_taken = input.to_i-1
    cells[cell_index_taken]
  end
  
  def full?
    cells.all? do |cell|
      cell == "X" or cell == "O"
    end
  end

  def turn_count
    cells.count{|cell| cell == "X" || cell == "O"}
  end
  def taken?(input)
    position(input) != "" && position(input) != " "
  end
  
  def valid_move?(input)
    (1..9).include?(input.to_i) && !taken?(input)
  end

  def update(input, player)
    input = input.to_i - 1
    cells[input] = player.token
  end

end