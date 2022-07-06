require_relative './tictactoe'

class TicTacToe1Player < TicTacToe

    def random_computer_move
        possible_moves = [1,2,3,4,5,6,7,8,9] - @moves_played.flatten
        possible_moves.sample
    end

    def choose_winning_space
        possible_moves = [1,2,3,4,5,6,7,8,9] - @moves_played.flatten
        nearly_complete_lines = @players_winning_lines[1].select {|line| (line & @moves_played[1]).size == 2}
        if nearly_complete_lines.length == 1 
            (nearly_complete_lines[0] & possible_moves)[0]
        end
    end

    def block_winning_space
        possible_moves = [1,2,3,4,5,6,7,8,9] - @moves_played.flatten
        nearly_complete_lines = @players_winning_lines[0].select {|line| (line & @moves_played[0]).size == 2}
        print nearly_complete_lines
        if nearly_complete_lines.length >= 1 
            (nearly_complete_lines[0] & possible_moves)[0]
        end
    end

    # def optimal_non_winning_space


    def choose_best_space
        if choose_winning_space
            choose_winning_space
        elsif block_winning_space
            block_winning_space
        else
            random_computer_move
        end
    end

    def remove_unavailable_lines(move)
        @players_winning_lines[@player_turn] = @players_winning_lines[@player_turn].select {|line| !line.include?(move)}
    end

    def run_game
        game_status = nil
        while game_status == nil do
            print_current_grid
            move = input_checker
            new_move(move)
            remove_unavailable_lines(move)
            game_status = winning_lines_check
            break if game_status != nil
            print_current_grid
            move = choose_best_space
            new_move(move)
            remove_unavailable_lines(move)
            game_status = winning_lines_check
        end
        print_current_grid
        print game_status 
    end

end
