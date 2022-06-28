require_relative "../tictactoe"

describe 'grid with moves played' do
    new_game = TicTacToe.new
    new_game.input(5)
    it 'returns grid with :X in central square when player1 inputs 5' do
    expect(new_game.grid).to eq [
        [1,2,3],
        [4,:X,6],
        [7,8,9]
    ]
    end
end

