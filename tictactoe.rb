require_relative 'board.rb'
require_relative 'player.rb'

class TicTacToe

    def initialize
        @board = Board.new
        @player1 = Player.new("Player 1", "X")
        @player2 = Player.new("Player 2", "O")
    end

    def start_game
        @board.display_board
        while @board.check_winner == nil
            [ @player1, @player2 ].each do |player|
                selection = nil
                loop do
                    selection = player.select_field
                    break if @board.position_available?(selection)
                    puts "Position already taken. Please select another position."
                end
                @board.update_board(selection, player.symbol)
                @board.display_board

                winner = @board.check_winner
                if winner == "X"
                    puts "Player 1 wins!"
                    break
                elsif winner == "O"
                    puts "Player 2 wins!"
                    break
                elsif @board.board_full?
                    puts "It's a tie!"
                    break
                end
            end
        end
    end

    def end_game
    end

    def reset
    end
end

game = TicTacToe.new
game.start_game
