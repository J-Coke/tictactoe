require_relative '../tictactoe'
#Tests for Tic tac toe
describe 'grid' do
    new_game = TicTacToe.new
    it 'is an array' do
        expect(new_game.grid.class).to eq(Array)
    end
    it 'is an array containing 3 rows' do
        expect(new_game.grid.length).to eq(3)
    end
    it 'is an array containing 3 columns' do
        expect(new_game.grid[0].length).to eq(3)
    end
    it 'has a 5 in 5 spot and 7 in 7 spot' do
        expect(new_game.grid[1][1]).to eq 5
        expect(new_game.grid[2][0]).to eq 7
    end
end

describe 'player_turn' do
    new_game = TicTacToe.new
    it "begins with player 1's turn" do
        expect(new_game.player_turn).to eq 0
    end
    it 'toggles to player2 after one move' do
        new_game.player_swap()
        expect(new_game.player_turn).to eq 1
    end
    it 'toggles back to player1 after two moves' do
        new_game.player_swap()
        expect(new_game.player_turn).to eq 0
    end
end