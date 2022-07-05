require_relative './tictactoe'

class TicTacToe1Player < TicTacToe
    def random_computer_move
        possible_moves = [1,2,3,4,5,6,7,8,9] - @moves_played.flatten
        possible_moves.sample
    end

    def run_game
        game_status = nil
        while game_status == nil do
            print_current_grid
            move = input_checker
            new_move(move)
            game_status = winning_lines_check
            print_current_grid
            move = random_computer_move
            new_move(move)
            game_status = winning_lines_check

        end
        print_current_grid
        print game_status 
    end
end

new_game = TicTacToe1Player.new
new_game.run_game
 