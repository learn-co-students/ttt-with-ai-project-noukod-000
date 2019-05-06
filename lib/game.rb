class Game
  attr_accessor :board,:player_1,:player_2
# all 8 possible WIN_COMBINATIONS
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
          ]
          
  
  def initialize(player_1 =Players::Human.new("X"),player_2 = Players::Human.new("O"),board = Board.new)
    @player_1,@player_2,@board = player_1,player_2,board
  end 
  
def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end
 
 def won?
    WIN_COMBINATIONS.each {|win_combo|
      position_1 = board.cells[win_combo[0]]
      position_2 = board.cells[win_combo[1]]
      position_3 = board.cells[win_combo[2]]

      return win_combo if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
    }
    return false
  end
  
  def draw?
     if !won? && board.full?
        return true
      else 
        return false
      end
  end 
  
        #verify is the game is over
    def over?
      if draw? || won?  || board.full? 
        return true
      else
        return false
      end
      
    end
    
     #get who's the winner
    def winner
      save = won?
      if save == false
        return nil
      end
      if board.cells[save[0]] == "X"
        return "X"
      elsif board.cells[save[0]] == "O"
        return "O"
      end
    end
    
  #make the action after verifying 
def turn
    input = current_player.move(board)
    if !board.valid_move?(input)
      turn
    else
      puts "Turn: #{@board.turn_count+1}"
      puts "Player #{current_player} move to position #{input}"
      board.update(input,current_player)
      board.display
    end
  end
  
  def play
    until over?
      turn
    end

    if won?
      winner = winner()
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end

end 