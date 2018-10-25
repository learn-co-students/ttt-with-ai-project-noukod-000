module Players
  class Computer < Player
    def move board
      position = STDIN.gets.chomp
      position
    end
  end
end
