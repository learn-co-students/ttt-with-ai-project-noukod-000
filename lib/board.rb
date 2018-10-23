# class Board
# attr_accessor :cells
#
# def initialize
#   @cells = [" "," "," "," "," "," "," "," "," "]
#   reset!
# end
#
# def reset!
#   @cells = [" "," "," "," "," "," "," "," "," "]
#
# end
#
#   def display
#
#     print "cells: #{@cells}"
#      puts
#
#      puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
#      puts ("-----------")
#      puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
#      puts ("-----------")
#      puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
#
#      puts
#   end
#
#    def position
#      @cells[input.to_i -1]
#
#    end
#
#    def update(position, player)
#      @cells[position.to_i -1] = player.token
#    end
#
#    def full?
#       !@cells.include?(' ')
#
#    end
#
#    def taken?(position)
#     @cells[position.to_i - 1] == 'X' || @cells[position.to_i - 1] == 'O'
#   end
#
#   def valid_move?(move)
#     move.to_i > 0 && move.to_i < 10 && !taken?(move)
#   end
#
#   def turn_count(board)
#   @cells = 0
#   board.each do |index|
#     if index == "X" || index == "O"
#       @cells += 1
#     end
#   end
#   return @cells
#
# end

class Board
  attr_accessor :cells
  def initialize()
    reset!
  end
  def reset!
    @cells = Array.new(9, " ")
  end
  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  def full?
    cells.all?{|token| token == "X" || token == "O"}
  end
  def turn_count
    cells.count{|token| token == "X" || token == "O"}
  end
  def valid_move?(input)
    input.to_i.between?(1,9) && !taken?(input)
  end
  def update(input, player)
    cells[input.to_i-1] = player.token
  end
  def position(input)
    cells[input.to_i-1]
  end
  def taken?(input)
    !(position(input) == " " || position(input) == "")
  end
end
