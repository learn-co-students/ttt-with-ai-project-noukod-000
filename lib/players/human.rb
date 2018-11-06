module Players
  class Human < Player
    def move(board)
      self.getAnInteger
    end

    def getAnInteger
    	count = 0
    	cInt = ""
    	m = /\A\d+\z/
    	while !cInt.validate(m)
    		puts "Invalid number.\n Please choose again : " if count>0
    		cInt = gets.strip
    		count += 1
    	end
    	cInt
    end
  end
end
