class Board
    WINNING_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [2, 4, 6]
    ]
    def initialize
        @board = [
                      1, 2, 3,
                      4, 5, 6,
                      7, 8, 9
                    ]

    end

    def display_board
        @board.each_with_index do | cell, index |
            print "#{cell} "
            print "|" if (index + 1) % 3 != 0
            print "\n--|--|--\n" if (index + 1) % 3 == 0 && index != @board.size - 1
        end
        print "\n"
    end

    def update_board(position, symbol)
        @board[position - 1] = symbol
    end

    def position_available?(position)
        if @board[position - 1] == "X" || @board[position - 1] == "O"
            return false
        else
            return true
        end
    end
    
    def board_full?
        @board.all? { |cell| cell == "X" || cell == "O" }
    end


    def check_winner
        WINNING_COMBINATIONS.each do |combination|
            if @board[combination[0]] == @board[combination[1]] && @board[combination[1]] == @board[combination[2]]
                return @board[combination[0]]
            end
        end
        return nil
    end
end