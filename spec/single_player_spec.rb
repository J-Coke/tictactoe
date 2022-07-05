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

describe 'choosing a play'
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
        end
    end
    describe 'choose_best_space' do
        it 'chooses winning space over blocking the other player' do
            new_game.moves_played = [[1,3,9],[5,6]]
            expect(new_game.choose_best_space).to eq 4
        end
    end