class TicTacToe

    attr_accessor :grid, :player_turn, :player_symbols, :moves_played

    def initialize() 
        @grid = [[1,2,3],[4,5,6],[7,8,9]]
        @player_turn = :player1
        @player_symbols = {player1: :X, player2: :O  }
        @moves_played = {player1: [], player2: []}
        # {:player1 => [[1,2,3],]}
    end

    def player_swap
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
                square == move ? @player_symbols[@player_turn] : square
            end
            )
        end
    end

    def new_move(move)
        grid_updater(move)
        # (@moves_played[@player_turn]).push(move)
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

end

