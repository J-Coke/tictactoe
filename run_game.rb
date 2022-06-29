require_relative "../tictactoe"

new_game = TicTacToe.new
# print "#{new_game.player_turn} please make your move: "
move = new_game.input_checker
new_game.grid_updater(move)
new_game.print_current_grid
new_game.player_swap
new_game.input_checker
new_game.grid_updater(move)
new_game.print_current_grid