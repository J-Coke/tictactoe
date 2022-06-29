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

describe 'input validator' do
    new_game = TicTacToe.new
    it 'returns false when input is not a number between 1-9' do
        expect(new_game.input_validator('X')).to eq false
    end
    new_game.grid_updater(5)
    it 'returns false when square is occupied' do
        expect(new_game.input_validator(5)).to eq false
    end
    it 'returns true when input is valid' do
        expect(new_game.input_validator(4)).to eq true
    end
end
