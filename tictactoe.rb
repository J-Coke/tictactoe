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

    def input_with_validity_checker(move)
        if move.to_s.match?(/[^1-9]/)
            "Invalid input, please enter a number 1-9"
        elsif !grid.include?(move)
            "This square is taken, please choose another"
        else
            grid_updater(move)
        end
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
new_game.grid_updater(5)
new_game.print_current_grid
