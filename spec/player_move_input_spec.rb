require_relative "../tictactoe"

# describe 'grid with moves played' do
#     new_game = TicTacToe.new
#     new_game.input(5)
#     it 'returns grid with :X in central square when player1 inputs 5' do
#     expect(new_game.grid).to eq [
#         [1,2,3],
#         [4,:X,6],
#         [7,8,9]
#     ]
#     end
# end

describe 'grid with invalid moves played' do
    new_game = TicTacToe.new
    it 'raises an exception when input is not a number between 1-9' do
        expect(new_game.input('X')).to raise_error("InvalidInput")
    end
end