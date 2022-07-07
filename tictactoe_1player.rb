require_relative './tictactoe'

class TicTacToe1Player < TicTacToe
    def possible_moves
        [1,2,3,4,5,6,7,8,9] - @moves_played.flatten
    end

    def random_computer_move
        possible_moves.sample
    end

    def cover_opposite_corner
        first_move_corner_checker = @moves_played.flatten.length == 1 && [1,3,7,9].include?(@moves_played[0][0])
        corners = [[1,9],[3,7]]
        corner_pair = (corners.select {|pair| pair.include?(@moves_played[0][0])}).flatten
        first_move_index = corner_pair.find_index(@moves_played[0][0])
        corner_pair[(first_move_index + 1) % 2] if first_move_corner_checker
    end

    def choose_winning_space
        nearly_complete_lines = @players_winning_lines[1].select {|line| (line & @moves_played[1]).size == 2}
        if nearly_complete_lines.length == 1 
            (nearly_complete_lines[0] & possible_moves)[0]
        end
    end

    def block_winning_space
        nearly_complete_lines = @players_winning_lines[0].select {|line| (line & @moves_played[0]).size == 2}
        if nearly_complete_lines.length >= 1 
            (nearly_complete_lines[0] & possible_moves)[0]
        end
    end

    def spaces_most_own_winning_lines
        all_moves = @players_winning_lines[@player_turn].flatten
        move_count = possible_moves.map {|move| all_moves.count(move)}
        max_move_count = move_count.max
        best_own_spaces_array = []
        move_count.each_with_index do |count, index|
            if count == max_move_count
                best_own_spaces_array << possible_moves[index]
            end
        end
        best_own_spaces_array
    end

    def block_winning_lines
        all_moves = @players_winning_lines[(@player_turn + 1) % 2].flatten
        move_count = spaces_most_own_winning_lines.map {|move| all_moves.count(move)}
        max_move_count = move_count.max
        block_winning_lines_array = []
        move_count.each_with_index do |count, index|
            if count == max_move_count
                block_winning_lines_array << spaces_most_own_winning_lines[index]
            end
        end
        block_winning_lines_array.sample
    end


    def choose_best_space
        if cover_opposite_corner
            cover_opposite_corner
        elsif choose_winning_space
            choose_winning_space
        elsif block_winning_space
            block_winning_space
        elsif block_winning_lines
            block_winning_lines
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
