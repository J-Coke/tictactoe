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

describe 'winning_lines_check' do
    it 'can recognise a winning line for player1' do
        new_game = TicTacToe.new
        new_game.moves_played = [[1,2,3,5],[4,9,8]]
        expect(new_game.winning_lines_check).to eq 0
    end
    it 'can recognise a winning line for player2' do
        new_game = TicTacToe.new
        new_game.moves_played = [[1,2,5,6],[7,9,8]]
        expect(new_game.winning_lines_check).to eq 1
    end
    it 'can recognise when no player has won' do
        new_game = TicTacToe.new
        new_game.moves_played = [[1,3,5],[9,8,6]]
        expect(new_game.winning_lines_check).to eq -1
    end
end