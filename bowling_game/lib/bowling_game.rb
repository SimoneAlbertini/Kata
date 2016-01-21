class BowlingGame
  def initialize
    @rolls = []
    @frames = []
  end

  def roll(score)
    if @frames.any? && @frames.last.size < 2
      @frames.last << score
    else
      @frames << [score]
    end
  end

  def score
    @frames.each_with_index.inject(0) do |score, (current_frame, i)|
      score += current_frame[0] + current_frame[1]
      score += is_spare?(current_frame)? @frames[i.succ][0] : 0
    end
  end

  private

  def is_spare?(frame)
    frame.size == 2 && (frame[0] + frame[1]) == 10
  end

end