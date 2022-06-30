require_relative "../tictactoe"

describe 'moves_played' do
    new_game = TicTacToe.new
    new_game.new_move(5)
    it 'updates moves played when player1 inputs 5' do
    expect(new_game.moves_played[0]).to eq [5]
    expect(new_game.moves_played[1]).to eq []
    end
    it 'updates latest grid with player2"s move in correct position after 2 moves' do
        new_game.new_move(1)
        expect(new_game.moves_played[0]).to eq [5]
        expect(new_game.moves_played[1]).to eq [1]
    end
    it 'updates latest grid with player1"s move in correct position after 3 moves' do
        new_game.new_move(6)
        expect(new_game.moves_played[0]).to eq [5,6]
        expect(new_game.moves_played[1]).to eq [1]
    end
end