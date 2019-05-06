class TicTacToeCLI
  def launch_game
    input = ""
    until input == "exit"
      system "cls" or system "clear"
      puts "Welcom to Tic-tac-toe game"

      puts "What kind of game do you want to play:","0. Computer vs Computer","1. Player vs Computer","2. Player vs Player","3. Exit"

      kind = gets.strip.to_i

      case kind
      when 0
        game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
        system "cls" or system "clear"
        game.play

      when 1
        puts "Do you want to go first with X ? (y/n)"
        choice = gets.strip.downcase

        if choice == "y" or choice == "yes"
          game = Game.new(Players::Human.new("X"),Players::Computer.new("O"))
          system "cls" or system "clear"
          game.play
        else
          game = Game.new(Players::Computer.new("X"),Players::Human.new("O"))
          system "cls" or system "clear"
          game.play
        end

      when 2
        system "cls" or system "clear"
        game = Game.new
        game.play
        
      when 3
        input = "exit"
      end
      break if input == "exit"
      puts "\n","Do you want to re-play? (y/n)"
      input = gets.strip.downcase
      input = "exit" if input == "n" or input == "no"
    end
    puts "Bye Bye!!"
  end
end