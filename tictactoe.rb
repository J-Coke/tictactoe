class TicTacToe

    attr_reader :grid, :player_turn

    def initialize() 
        @grid = [1,2,3,4,5,6,7,8,9]
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
end
