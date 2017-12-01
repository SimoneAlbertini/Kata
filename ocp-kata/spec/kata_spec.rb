require_relative '../lib/game_factory'

describe 'OCP FizzBuzz' do
  subject(:game) { GameFactory.create }

  it 'should just say 1' do
    expect(game.say 1).to eq '1'
  end

  it 'should say 2' do
    expect(game.say(2)).to eq '2'
  end

  it 'should FIZZ when multiple of 3' do
    expect(game.say 3).to eq 'FIZZ'
    expect(game.say 6).to eq 'FIZZ'
  end

  it 'should BUZZ when multiple of 5' do
    expect(game.say 5).to eq 'BUZZ'
    expect(game.say 10).to eq 'BUZZ'
  end

  it 'should FIZZBUZZ when multitple of 3 and 5' do
    expect(game.say 15).to eq 'FIZZBUZZ'
    expect(game.say 30).to eq 'FIZZBUZZ'
  end
end