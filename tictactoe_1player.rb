require_relative './tictactoe'

class TicTacToe1Player < TicTacToe
    # attr_accessor :players_winning_lines
    # def initialize() 
    #     @players_winning_lines = [
    #         [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]],
    #         [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
    #     ]
    # end

    def random_computer_move
        possible_moves = [1,2,3,4,5,6,7,8,9] - @moves_played.flatten
        possible_moves.sample
    end

    # def new_move(move)
    #     grid_updater(move)
    #     @moves_played[@player_turn] << move
    #     player_swap()
    # end

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
        if nearly_complete_lines.length >= 1 
            (nearly_complete_lines[0] & possible_moves)[0]
        end
    end

    def choose_best_space
        if choose_winning_space
            choose_winning_space
        elsif block_winning_space
            block_winning_space
        else
            random_computer_move
        end
    end

    def run_game
        game_status = nil
        while game_status == nil do
            print_current_grid
            move = input_checker
            new_move(move)
            game_status = winning_lines_check
            break if game_status != nil
            print_current_grid
            move = choose_best_space
            new_move(move)
            game_status = winning_lines_check
        end
        print_current_grid
        print game_status 
    end

end

# new_game = TicTacToe1Player.new
# new_game.run_game
 