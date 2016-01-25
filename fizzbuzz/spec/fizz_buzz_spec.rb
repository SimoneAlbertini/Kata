require_relative '../lib/fizz_buzz.rb'

describe FizzBuzz do
  before do
    @fizz_buzz = FizzBuzz.new
  end

  it 'returns nothing if negative' do
    expect(fizz_buzz_of -1).to eq ''
  end

  it 'should return FIZZ if multiple of 3' do
    expect(fizz_buzz_of 12).to eq 'FIZZ'
  end

  it 'should return BUZZ if multiple of 5' do
    expect(fizz_buzz_of 10).to eq 'BUZZ'
  end

  it 'should return FIZZBUZZ if multiple of 3 and 5' do
    expect(fizz_buzz_of 15).to eq 'FIZZBUZZ'
  end

  it 'should return BANG if multiple of 7' do
    expect(fizz_buzz_of 28).to eq 'BANG'
  end

  it ' should return FIZZBUZZBANG if multiple of 3, 5 and 7' do
    expect(fizz_buzz_of 105).to eq 'FIZZBUZZBANG'
  end


  def fizz_buzz_of(number)
    @fizz_buzz.generate number
  end
end