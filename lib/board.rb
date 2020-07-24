class Board
  attr_accessor :cells

  @cells = Array.new(9, " ")

  def initialize
    reset!

  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position input
    @cells[input_to_index input]
  end

  def input_to_index input
    input.to_i - 1
  end

  def full?
    @cells.none?{|cell| cell == " "}
  end

  def turn_count
    @cells.count('X') + @cells.count('O')
  end

  def taken? position
    input = input_to_index position
    !(@cells[input] == "" || @cells[input] == " ")
  end

  def valid_move? position
    input = input_to_index position
    input.between?(0, 8) && !taken?(position)
  end

  def update position, player
    @cells[input_to_index position] = player.token
  end
end
