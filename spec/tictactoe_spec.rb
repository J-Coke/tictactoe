require_relative '../tictactoe'

describe 'grid' do
    new_game = TicTacToe.new
    it 'returns an array' do
        expect(new_game.grid.class).to eq(Array)
    end
    it 'returns an array of length 3' do
        expect(new_game.grid.length).to eq(3)
    end
    it 'returns an array containing nested arrays of length 3' do
        expect(new_game.grid[0].length).to eq(3)
    end
    it 'has a 5 in 5 spot and 7 in 7 spot' do
        expect(new_game.grid[1][1]).to eq 5
        expect(new_game.grid[2][0]).to eq 7
    end
end
