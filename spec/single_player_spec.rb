require_relative '../tictactoe_1player'

describe 'random_computer_move' do
    it 'chooses the remaining number when the other eight are taken' do
        new_game = TicTacToe1Player.new
        new_game.moves_played = [[1,2,3,4],[5,6,7,8]]
        expect(new_game.random_computer_move).to eq 9
    end
    it 'chooses the remaining number when the other eight are taken' do
        new_game = TicTacToe1Player.new
        new_game.moves_played = [[1,2,3],[5,6,7]]
        expect([4,8,9]).to include(new_game.random_computer_move)
    end
end

describe 'remove_unavailable_lines' do
    new_game = TicTacToe1Player.new
    it 'removes player1"s winning lines when occupied by player2' do
        new_game.moves_played = [[1],[]]
        new_game.remove_unavailable_lines(5)
        expect(new_game.players_winning_lines[0]).to eq [[1,2,3],[7,8,9],[1,4,7],[3,6,9]]
    end
    it 'removes player2"s winning lines when occupied by player1' do
        new_game.moves_played = [[],[]]
        new_game.player_turn = 1
        new_game.remove_unavailable_lines(3)
        expect(new_game.players_winning_lines[1]).to eq [[4,5,6],[7,8,9],[1,4,7],[2,5,8],[1,5,9]]
    end
end

describe 'choosing a play' do
    describe 'cover_opposite_corner' do
        new_game = TicTacToe1Player.new
        it 'chooses the opposite corner when the first move was a corner' do
            new_game.moves_played = [[1],[]]
            expect(new_game.cover_opposite_corner).to eq 9
            new_game.moves_played = [[7],[]]
            expect(new_game.cover_opposite_corner).to eq 3
        end
    end
    describe 'choose_winning_space' do
        new_game = TicTacToe1Player.new
        it 'chooses to complete a winning line' do
            new_game.moves_played = [[1,2,4],[5,7]]
            expect(new_game.choose_winning_space).to eq 3
        end
    end
    describe 'block_winning_space' do
        new_game = TicTacToe1Player.new
        it 'chooses to block the other player when they are about to win' do
            new_game.moves_played = [[1,3],[5]]
            expect(new_game.block_winning_space).to eq 2
            new_game.moves_played = [[2,5,7],[8,9]]
            new_game.remove_unavailable_lines(8)
            new_game.remove_unavailable_lines(9)
            expect(new_game.block_winning_space).to eq 3
        end
    end
    describe 'optimal_non_winning_space' do
        new_game = TicTacToe1Player.new
        new_game.moves_played = [[5],[]]
        new_game.remove_unavailable_lines(5)
        it 'chooses the number contained in the most of their own winning lines' do
            expect(new_game.spaces_most_own_winning_lines).to eq [1,3,7,9]
        end
    end
    describe 'block_winning_lines' do
        new_game = TicTacToe1Player.new
        new_game.moves_played = [[1,8],[7]]
        new_game.remove_unavailable_lines(1)
        new_game.remove_unavailable_lines(8)
        new_game.player_swap
        new_game.remove_unavailable_lines(7)
        it 'chooses the space which blocks the most opponent"s winning lines' do
            expect(new_game.block_winning_lines).to eq 5
        end
    end
    describe 'choose_best_space' do
        new_game = TicTacToe1Player.new
        it 'chooses winning space over blocking the other player' do
            new_game.moves_played = [[1,3,9],[5,6]]
            expect(new_game.choose_best_space).to eq 4
        end
    end
end