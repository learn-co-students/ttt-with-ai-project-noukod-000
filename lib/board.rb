class Board
  attr_accessor :cells
  def initialize
    self.reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def position(pos)
    @cells[pos.to_i-1] if pos.validate(/\A\d+\z/) && (1..9).cover?(pos.to_i)
  end

  def display
    sLine = ""
    count_l = 0

    3.times{
    	puts tab_line(count_l)
    	if count_l < 2
    		puts "-----------"
    	end
      count_l += 1
    }
  end


  def tab_line(l_num)
      line = " "
  	count = 0
  	3.times{ line  += "#{@cells[ l_num*3 + count ]}"
  	         if count < 2
  			          line += " | "
  			     else
  			          line += " "
  			     end
  	         count += 1 }
  	return line
  end

  def update(pos, player)
    @cells[pos.to_i-1] = player.token if (self.position(pos) == " ")
  end

  def turn_count
    @cells.count{|token| token == "X" || token == "O"}
  end

  def full?
    @cells.all?{|case_i| case_i != " "}
  end

  def taken?(pos)
    !(self.position(pos) == " ") #self.position(pos).nil? ||
  end

  def valid_move?(pos)
    !self.taken?(pos)
  end
end
