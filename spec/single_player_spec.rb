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
end

describe 'choosing a play' do
new_game = TicTacToe1Player.new
    describe 'choose_winning_space' do
        it 'chooses to complete a winning line' do
            new_game.moves_played = [[1,2,4],[5,7]]
            expect(new_game.choose_winning_space).to eq 3
        end
    end
    describe 'block_winning_space' do
        it 'chooses to block the other player when they are about to win' do
            new_game.moves_played = [[1,3],[5]]
            expect(new_game.block_winning_space).to eq 2
            new_game.moves_played = [[2,5,7],[8,9]]
            new_game.remove_unavailable_lines(8)
            new_game.remove_unavailable_lines(9)
            expect(new_game.block_winning_space).to eq 3
        end
    end
    # describe 'optimal_non_winning_space' do
    #     new_game.moves_played = [[5],[]]
    #     it 'chooses the number contained in the most of their own winning lines' do
    #         expect([1,3,7,9]).to include(new_game.optimal_non_winning_space)
    #     end
    # end
    describe 'choose_best_space' do
        it 'chooses winning space over blocking the other player' do
            new_game.moves_played = [[1,3,9],[5,6]]
            expect(new_game.choose_best_space).to eq 4
        end
    end
end