module Players
  class Human < Player
    # your code her

    def move board
      super
      gets.strip
    end
  end
end