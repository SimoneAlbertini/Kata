class BowlingGame
  def initialize
    @frames = []
  end

  def roll(score)
    if @frames.any? && is_second_roll_of_frame && last_roll_was_not_strike
      @frames.last << score
    else
      @frames << [score]
    end
  end

  def score
    @frames.take(10).each_with_index.inject(0) do |score, (current_frame, i)|
      score += pins_hit_in current_frame
      score += is_spare?(current_frame) ? next_frame(i).first : 0
      score += is_strike?(current_frame) ? strike_bonus(i) : 0
    end
  end

  private

  def next_frame(i)
    @frames[i.succ]
  end

  def is_spare?(frame)
    !is_strike?(frame) && (pins_hit_in frame) == 10
  end

  def pins_hit_in(frame)
    frame[0] + (frame[1] || 0)
  end

  def is_strike?(frame)
    frame[0] == 10
  end

  def is_second_roll_of_frame
    @frames.last.size < 2
  end

  def last_roll_was_not_strike
    !is_strike?(@frames.last)
  end

  def strike_bonus(i)
    next_frame = next_frame(i)
    next_next_frame = next_frame(i.succ)
    next_frame[0] + (next_frame[1] || next_next_frame[0])
  end
end
