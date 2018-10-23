# class Player
#   attr_reader :token
#   def initialize(token)
#     @token = token
#   end
# end
module Players
  class Human < Player
    def move(board)
    	puts "Enter your move: "
    	gets.chomp
    end
  end
end
