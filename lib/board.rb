class Board 
  attr_accessor :cells
  @cells = []
  
  def reset!
     @cells = Array.new(9," ")
  end 
  
  def initialize
    reset!
  end 
            
  #method to display the board
def display
  puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
  puts "-----------"
  puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
  puts "-----------"
  puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
end 

#set user input into array index       
  def input_to_index(user_input)
    index = user_input.to_i - 1
  end 
  
  def position(index)
    position = input_to_index(index)
    val = @cells[position]
    val
  end 
  
  def full?
    !(@cells.include?(" "))
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end
  
  #method to verify if a position is free or taken
  def taken?(index) 
    index = index.to_i - 1 if index.class == String
    !(@cells[index] == " " || @cells[index] == nil)
  end
      
     #method to verify the user input is valid
def valid_move?(index)
    index = input_to_index(index)
    #index.between?(0,8) && !taken?(index)
    return true if taken?(index) == false && index.between?(0,8)
end  
    
     #put user input on the board
  def update(index, value)
    index = input_to_index(index)
    @cells[index] = value.token
  end
  
  
end 