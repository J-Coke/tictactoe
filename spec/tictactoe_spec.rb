require_relative '../tictactoe'
#Tests for Tic tac toe
describe 'grid' do
    new_game = TicTacToe.new
    it 'is an array' do
        expect(new_game.grid.class).to eq(Array)
    end
    it 'is an array of length 9' do
        expect(new_game.grid.length).to eq(9)
    end
    it 'has a 5 in 5 spot and 7 in 7 spot' do
        expect(new_game.grid[4]).to eq 5
        expect(new_game.grid[6]).to eq 7
    end
end

describe 'player_turn' do
    new_game = TicTacToe.new
    it "begins with player 1's turn" do
        expect(new_game.player_turn).to eq :player1
    end
    it 'toggles to player2 after one move' do
        new_game.new_move()
        expect(new_game.player_turn).to eq :player2
    end
    it 'toggles back to player1 after two moves' do
        new_game.new_move()
        expect(new_game.player_turn).to eq :player1
    end
end