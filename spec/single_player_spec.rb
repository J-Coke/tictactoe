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