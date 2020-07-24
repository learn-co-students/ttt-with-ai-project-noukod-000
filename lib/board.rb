class Board
  attr_accessor :cells, :reset
  @cells = []
  
  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  
  def initialize
    reset!
  end
  
  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts " ----------- "
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts " ----------- "
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  
  def position(val)
    index = input_to_index(val)
    cells[index]
  end
  
  def turn_count
    taken = 0
    @cells.each do |i|
      if i == "X" || i == "O"
        taken += 1
      end
    end
    return taken
  end
  
  
  def full?
    if turn_count == 9
      true
    end
  end
  
  def taken?(val)
   val = val.to_i - 1 if val.class == String
    !(cells[val].nil? || cells[val] == " ")
  end

  def valid_move?(input)
    input=input.to_i - 1
    input.between?(0, 8) && !taken?(input)
  end
  
  def update(position, player)
    index = input_to_index(position)
    cells[index] = player.token
  end
  
  
  
end