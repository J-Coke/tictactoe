require_relative "../tictactoe"


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

describe 'players input different symbols' do
    
    new_game = TicTacToe.new
    it 'players have correct symbols' do
        expect(new_game.player_symbols[:player1]).to eq :X
        expect(new_game.player_symbols[:player2]).to eq :O
    end
    
    new_game.player_turn = :player2
    new_game.grid_updater(5)
    it 'player2 inputs O' do
        expect(new_game.grid).to eq [
            [1,2,3],
            [4,:O,6],
            [7,8,9]
        ]
    end
end

describe 'grid with moves played' do
    new_game = TicTacToe.new
    new_game.grid_updater(5)
    new_game.player_swap
    it 'returns grid with :X in central square when player1 inputs 5' do
    expect(new_game.grid).to eq [
        [1,2,3],
        [4,:X,6],
        [7,8,9]
    ]
    end
    it 'updates latest grid with player2"s move in correct position after 2 moves' do
        new_game.grid_updater(1)
        new_game.player_swap
        expect(new_game.grid).to eq [
            [:O,2,3],
            [4,:X,6],
            [7,8,9]
        ]
    end
    it 'updates latest grid with player1"s move in correct position after 3 moves' do
        new_game.grid_updater(6)
        new_game.player_swap
        expect(new_game.grid).to eq [
            [:O,2,3],
            [4,:X,:X],
            [7,8,9]
        ]
    end
end