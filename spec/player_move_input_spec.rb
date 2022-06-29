require_relative "../tictactoe"

describe 'grid with moves played' do
    new_game = TicTacToe.new
    new_game.grid_updater(5)
    it 'returns grid with :X in central square when player1 inputs 5' do
    expect(new_game.grid).to eq [
        [1,2,3],
        [4,:X,6],
        [7,8,9]
    ]
    end
end

describe 'validity checker' do
    new_game = TicTacToe.new
    it 'displays invalid input message when input is not a number between 1-9' do
        expect(new_game.input_with_validity_checker('X')).to eq ("Invalid input, please enter a number 1-9")
    end
    new_game.grid_updater(5)
    it 'displays "square already occupied" message when square is occupied' do
        expect(new_game.input_with_validity_checker(5)).to eq "This square is taken, please choose another"
    end

end