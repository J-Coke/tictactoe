require_relative "../tictactoe"

describe 'moves_played' do
    new_game = TicTacToe.new
    new_game.grid_updater(5)
    new_game.player_swap
    it 'updates moves played when player1 inputs 5' do
    expect(new_game.moves_played[:player1]).to eq [5]
    expect(new_game.moves_played[:player2]).to eq []
    end
    # it 'updates latest grid with player2"s move in correct position after 2 moves' do
    #     new_game.grid_updater(1)
    #     new_game.player_swap
    #     expect(new_game.grid).to eq [
    #         [:O,2,3],
    #         [4,:X,6],
    #         [7,8,9]
    #     ]
    # end
    # it 'updates latest grid with player1"s move in correct position after 3 moves' do
    #     new_game.grid_updater(6)
    #     new_game.player_swap
    #     expect(new_game.grid).to eq [
    #         [:O,2,3],
    #         [4,:X,:X],
    #         [7,8,9]
    #     ]
    # end
end