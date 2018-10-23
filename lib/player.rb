# class Player
#
#   #initialize accepts a token to assign
#   def initialize(token)
#      @token = "X"
#   end
#
#   # token cannot be changed once assigned in initialize
#   def token
#     @token = "O"
#   end
#
# end


class Player
  attr_reader :token

  def initialize(token)
    @token = token
  end
end
