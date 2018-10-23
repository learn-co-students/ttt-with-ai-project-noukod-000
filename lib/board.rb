class Board
  attr_accessor :cells
  def initialize
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(user_input)
    @cells[user_input.to_i - 1]
  end

  def full?
    @cells.all? {|x| x != " "}
  end

  def turn_count
    @cells.collect {|x| x == " "}.size / 3
  end

  def taken?(position)
    cells[position.to_i - 1] == "X" || cells[position.to_i - 1] == "O"
  end

  def valid_move?(position)
    !(taken?(position))  && (0..9).include?(position.to_i - 1)
  end

  def update(position, token)
     token = "X" #update updates the cells in the board with the player token according to the input
    cells[position.to_i - 1] = token
    display
  end

end




# require "pry"
#
# class Player::Computer < Player
#   attr_accessor :board
#   WIN_COMBINATIONS = [
#   [0, 1, 2],
#   [3, 4, 5],
#   [6, 7, 8],
#   [0, 3, 6],
#   [1, 4, 7],
#   [2, 5, 8],
#   [0, 4, 8],
#   [6, 4, 2]
#   ]
#   CORNERS = [0, 2, 8, 6]
#
#   def move(board, timer = 0)
#     @board = board
#     timer <= 0 ? @timer = 0.01 : @timer = timer
#     case
#       when winning_move != nil
#         input = winning_move + 1
#       when blocking_move != nil
#         input = blocking_move + 1
#       when center?
#         input = 5
#       when opposite_corner != nil && board.taken?(opposite_corner) == false
#         input = opposite_corner
#       when corner
#         input = corner + 1
#       else
#         until !board.taken?(input)
#           input = (1..9).to_a.sample
#         end
#     end
#     sleep(@timer)
#     input.to_s
#   end
#   def other
#     token == "X" ? "O" : "X"
#   end
#   def winning_move
#     winning_row = WIN_COMBINATIONS.find do |combo|
#       (board.cells[combo[0]] == token && board.cells[combo[1]] == token && board.cells[combo[2]] == " ") || (board.cells[combo[2]] == token && board.cells[combo[1]] == token && board.cells[combo[0]] == " ") || (board.cells[combo[0]] == token && board.cells[combo[2]] == token && board.cells[combo[1]] == " ")
#     end
#     if winning_row != nil
#       winning_cell = winning_row.find {|cell| board.cells[cell] == " "}
#     end
#   end
#   def blocking_move
#     winning_row = WIN_COMBINATIONS.find do |combo|
#       (board.cells[combo[0]] == other && board.cells[combo[1]] == other && board.cells[combo[2]] == " ") || (board.cells[combo[1]] == other && board.cells[combo[2]] == other && board.cells[combo[0]] == " ") || (board.cells[combo[2]] == other && board.cells[combo[0]] == other && board.cells[combo[1]] == " ")
#     end
#     if winning_row != nil
#       winning_cell = winning_row.find {|cell| board.cells[cell] == " "}
#     end
#   end
#   def center?
#     board.cells[4] == " "
#   end
#   def corners
#     CORNERS.shuffle!
#   end
#   def corner
#     corners.find {|corner| board.cells[corner] == " "}
#   end
#   def opposite_corner
#     case
#       when board.taken?(1) && !board.taken?(9)
#         9
#       when board.taken?(9) && !board.taken?(1)
#         1
#       when board.taken?(3) && !board.taken?(7)
#         7
#       when board.taken?(7) && !board.taken?(3)
#         3
#       else
#         nil
#     end
#   end
# end
