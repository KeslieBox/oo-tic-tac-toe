class TicTacToe
    WIN_COMBINATIONS = [
        [0, 1, 2],
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6],
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8],
        [6, 4, 2]
    ]

    def initialize
        @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    end

    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end

    def input_to_index(string)
        string.to_i - 1
    end

    def move(index, token)
        @board[index] = token
    end

    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
    end

    def valid_move? (index)
        !position_taken?(index) && index.between?(0,8) 
    end

    def turn_count
        @board.count{|index| index == "X" || index == "O"}
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "Please choose a number 1-9:"
        user_input = gets.chomp
        index = input_to_index(user_input)
        if valid_move?(index)
          player_token = current_player
          move(index, player_token)
        else
          turn
        end
        display_board
    end

    def won?
        WIN_COMBINATIONS.each {|win_combo|
          index_0 = win_combo[0]
          index_1 = win_combo[1]
          index_2 = win_combo[2]
      
          position_1 = @board[index_0]
          position_2 = @board[index_1]
          position_3 = @board[index_2]
      
          if position_1 == "X" && position_2 == "X" && position_3 == "X"
            return win_combo
          elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
            return win_combo
          end
        }
        return false
      end
      
      def full?
        @board.all? {|index| index == "X" || index == "O"}
      end

      def draw?
        if !won? && full?
          return true
        else
          return false
        end
      end
      
      def over?
        if won? || draw?
          return true
        else
          return false
        end
      end
      
      def winner
        if combo = won?
          @board[combo[0]]
        end

      end
 
    def play
        turn until over?
        puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
    end
end


TicTacToe.new
