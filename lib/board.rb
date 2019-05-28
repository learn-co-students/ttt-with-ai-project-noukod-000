class Board
  attr_accessor :cells
  
  def initialize
    @cells = Array.new(9, " ")
    puts @cells
  end
  
  def reset!
    @cells.clear
    @cells = Array.new(9, " ")
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def position(input)
    @cells[input.to_i-1] # 0-8
  end
  
  def full? # either x or o
    @cells.all?{|token| token == "X" || token == "O"}
  end
  
  def turn_count
    @cells.count { |turn| turn == "X" || turn == "O"}
  end
  
  def taken?(input)
    !(position(input) == " " || position(input) == "")
  end
  
  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end
  
  def update(input, player)
    cells[input.to_i-1] = player.token
  end

end