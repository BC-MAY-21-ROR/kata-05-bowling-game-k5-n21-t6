# frozen_string_literal: true

#Class to start bwoling game to fill an array with the results of 2 shots
class Bowling
    def init
      @shot1 = 0
      @shot2 = 0
      @score_board = Array.new(10)
    end

    def set (shot)
      if shot == 1
        @shot1 = rand(0..10)
      else
        @shot2 = rand(0..(10 - @shot1))
      end
    end
    
    def fill_board (board_num, bonus)
      @score_board[board_num] = set(1)
      puts "primer tiro: " + @score_board[board_num].to_s

      @score_board[board_num] = @score_board[board_num] + set(2)
      puts "segundo tiro: " + @score_board[board_num].to_s
      case bonus
        when 1
          @score_board[board_num-1] = @score_board[board_num-1] + @shot1
        when 2
          @score_board[board_num-1] = @score_board[board_num-1] + @shot1 + @shot2
      end
      @score_board[board_num] = @score_board[board_num] + @score_board[board_num - 1] if board_num != 0
    end

    def game
      (0...10).each do |board|
        if @shot1 == 10
          fill_board(board,2)
        elsif @shot1 + @shot2 == 10
          fill_board(board,1)
        end
        fill_board(board,0)
      end
      puts @score_board
    end
    
end
tiro = Bowling.new()
tiro.init
tiro.game





