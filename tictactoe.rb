class TicTacToe

    attr_reader :grid, :player_turn

    def initialize() 
        @grid = [[1,2,3],[4,5,6],[7,8,9]]
        @player_turn = :player1
        # {:player1 => [[1,2,3],]}
    end

    def new_move
        if @player_turn == :player1
            @player_turn = :player2
        else
            @player_turn = :player1
        end
    end

    def grid_updater(move)
        
        @grid.each do | row |
            row.replace(
            row.map do | square |
                square == move ? :X : square
            end
            )
        end
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

end

new_game = TicTacToe.new
# print "#{new_game.player_turn} please make your move: "
move = new_game.input_checker
new_game.grid_updater(move)
new_game.print_current_grid
