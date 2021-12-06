# frozen_string_literal: true

#Class to start bwoling game to fill an array with the results of 2 shots
class Roll
    def tirar (tiro)
    @shot_1 = 0
    @shot_2 = 0
    @score_board = Array.new(10)

    if tiro==1
      @shot_1= rand(0..10)
    else
      @shot_2= rand(0..10-@shot_1)
    end
    end
    
end


