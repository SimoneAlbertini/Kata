require_relative '../lib/bowling_game'

describe BowlingGame do
  before do
    @game = BowlingGame.new
  end

  it 'should have 0 score if gutter game' do
    expect(score_of_game_that_rolls_only 0).to be 0
  end

  it 'should have score 20 if all 1' do
    expect(score_of_game_that_rolls_only 1).to be 20
  end

  it 'should count one spare' do
    roll 5, 5, 3
    17.times { roll 0 }
    expect(@game.score).to be 16
  end

  it 'should count one strike' do
    roll 10, 3, 4
    16.times { roll 0 }
    expect(@game.score).to be 24
  end

  # it 'should count subsequent strikes' do
  #   roll 10, 10, 3, 4
  #   14.times { roll 0 }
  #   expect(@game.score).to be 47
  # end

  # it 'should score a perfect game!' do
  #   12.times { roll 10 }
  #   expect(@game.score).to be 300
  # end

  def roll(*pins)
    pins.each { |p| @game.roll p }
  end

  def score_of_game_that_rolls_only(pins)
    20.times { @game.roll pins }
    @game.score
  end
end