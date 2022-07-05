require_relative './tictactoe'

class TicTacToe1Player < TicTacToe
    def random_computer_move
        possible_moves = [1,2,3,4,5,6,7,8,9] - @moves_played.flatten
        possible_moves.sample
    end
end

# new_game = TicTacToe1Player.new
# new_game.run_game