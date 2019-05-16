class Board

  attr_accessor :cells

  def reset!
      @cells = Array.new(9, " ")
  end

  def initialize
      @cells = Array.new(9," ")
    end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
      puts "-----------"
      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
      puts "-----------"
      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(pos)
      @cells[pos.to_i - 1]
  end

  def full?
    @cells.all?  {|pos| pos == "X" || pos == "O"}
  end

def turn_count
    counter = 0
    @cells.each do |pos|
      if pos == "X" || pos =="O"
        counter += 1
      end
    end
    return counter
end

def taken?(pos)
  if position(pos) == "" || position(pos) == " " || position(pos) == nil
    false
  elsif position(pos) == "X" || position(pos) == "O"
    true
  end
end

def valid_move?(pos)
    pos.to_i.between?(1,9) && !taken?(pos)? true : false
end

def update(input,player)
      valid_move?(input)? @cells[input.to_i - 1] = player.token : @cells[input.to_i - 1] = player.input
end

end
