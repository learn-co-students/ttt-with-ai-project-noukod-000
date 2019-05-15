require "pry"
module Players

  class Computer < Player

    def initialize (token)
       @all = []
     end

     def move board
       move = rand(9).to_i
       if @all.include?(move)
         move board
       else
         @all << move
         return move.to_s
       end
     end
  end

end
