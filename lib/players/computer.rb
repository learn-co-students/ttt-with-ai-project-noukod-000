module Players
  class Computer < Player
    def initialize (token)
      super
      @position = []
    end

    def move(board)
      move_b = rand(9).to_i
      if @position.include?(move_b)
        move(board)
      else
        @position << move_b
        return move_b.to_s
      end
    end
  end
end