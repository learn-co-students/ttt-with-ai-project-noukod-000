class Player
  # @@all = []
  attr_reader :token
  def initialize(key)
    @token = key
    # @@all << self
  end

  # def self.all
  #   @@all
  # end
  #
  # def self.reset_all
  #   @@all = []
  # end

  def move(board)
    puts "implement your own move"
  end
end
