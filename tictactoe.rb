class TicTacToe 

    attr_accessor :grid, :player_turn, :player_symbols, :moves_played, :winning_lines,:players_winning_lines

    def initialize() 
        @grid = [[1,2,3],[4,5,6],[7,8,9]]
        @player_turn = 0
        @player_symbols = [:X, :O]
        @moves_played = [[],[]]
        @winning_lines = [
            [1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]
        ]
        @players_winning_lines = [
            [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]],
            [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
        ]
    end

    def player_swap
        @player_turn = (@player_turn + 1 ) % 2
    end

    def grid_updater(move)
        
        @grid.each do | row |
            row.replace(
            row.map do | square |
                square == move ? @player_symbols[@player_turn] : square
            end
            )
        end
    end

    def new_move(move)
        grid_updater(move)
        @moves_played[@player_turn] << move
        player_swap()
    end

    def input_checker
        message = ""
        input_valid = false
        while !input_valid
            puts "#{@player_turn} please make your move: "
            move = gets.chomp
            input_valid = input_validator(move)
        end
        move.to_i
    end

    def input_validator(move)
        input_valid = false
        if move.to_s.match?(/[^1-9]/)
            message = "Invalid input, you must choose a number between 1-9"
        elsif grid.flatten.include?(move.to_i)
            input_valid = true    
        else
            message = "This square is taken, you must choose another!"
        end
        puts message
        input_valid
    end

    def print_current_grid
        print "\n#{grid[0][0]}|#{grid[0][1]}|#{grid[0][2]}\n"
        print "-----\n"
        print "#{grid[1][0]}|#{grid[1][1]}|#{grid[1][2]}\n"
        print "-----\n"
        print "#{grid[2][0]}|#{grid[2][1]}|#{grid[2][2]}\n"
    end

    def winning_lines_check
        wins_player1 = @winning_lines.select {|line| (line & @moves_played[0]).size == 3}
        wins_player2 = @winning_lines.select {|line| (line & @moves_played[1]).size == 3}
        if wins_player1.length > 0
            game_status = "Player 1 wins!"
        elsif wins_player2.length > 0
            game_status = "Player 2 wins!"
        elsif moves_played.flatten.length == 9
            game_status = "It's a draw!"
        else
          game_status = nil
      end
    end

    def run_game
        game_status = nil
        while game_status == nil do
            print_current_grid
            move = input_checker
            new_move(move)
            game_status = winning_lines_check
        end
        print_current_grid
        print game_status    
    end

end

