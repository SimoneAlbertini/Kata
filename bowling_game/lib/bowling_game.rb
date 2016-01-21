class BowlingGame
  def initialize
    @rolls = []
    @frames = []
  end

  def roll(score)
    if @frames.any? && is_second_roll_of_frame
      @frames.last << score
    else
      @frames << (score == 10? [score, 0] : [score])
    end
  end

  def score
    @frames.each_with_index.inject(0) do |score, (current_frame, i)|
      score += pins_hit_in current_frame
      score += is_spare?(current_frame)? @frames[i.succ].first : 0
      score += is_strike?(current_frame)? pins_hit_in(@frames[i.succ]) : 0
    end
  end

  private

  def is_spare?(frame)
    !is_strike?(frame) && (pins_hit_in frame) == 10
  end

  def pins_hit_in(frame)
    frame[0] + frame[1]
  end

  def is_strike?(frame)
    frame[0] == 10
  end

  def is_second_roll_of_frame
    @frames.last.size < 2
  end

end
