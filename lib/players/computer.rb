module Players
  class Computer < Player
    # your code here

    def move(board)
      rand(9).to_s
    end
  end
end
