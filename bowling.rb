# frozen_string_literal: true

# Class to start bwoling game to fill an array with the results of 2 shots
class Bowling
  def init
    @first_shot = 0
    @second_shot = 0
    @score_board = Array.new(10)
  end

  def set(shot)
    if shot == 1
      @first_shot = rand(0..10)
    else
      @second_shot = rand(0..(10 - @first_shot))
    end
  end

  def fill_board(board_num, bonus)
    @score_board[board_num] = set(1)
    puts "primer tiro: #{@score_board[board_num]}"
    @score_board[board_num] = @score_board[board_num] + set(2)
    puts "segundo tiro: #{@score_board[board_num]}"
    case bonus
    when 1
      @score_board[board_num - 1] = @score_board[board_num - 1] + @first_shot
    when 2
      @score_board[board_num - 1] = @score_board[board_num - 1] + @first_shot + @second_shot
    end
    @score_board[board_num] = @score_board[board_num] + @score_board[board_num - 1] if board_num != 0
  end

  def game
    (0...10).each do |board|
      if @first_shot == 10
        fill_board(board, 2)
      elsif @first_shot + @second_shot == 10
        fill_board(board, 1)
      end
      fill_board(board, 0)
      puts "Resultado: #{@score_board[board]}\n"
      puts "RONDA #{board + 1}\n\n"
    end
  end
end

tiro = Bowling.new
tiro.init
tiro.game
