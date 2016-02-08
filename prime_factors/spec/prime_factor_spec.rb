require 'rspec'
require_relative '../lib/prime_factor'

describe PrimeFactor do

  it 'should return nothing if 1 is given ' do
    assert_prime_factors_for 1, are: []
  end

  it 'should return prime factors of 2' do
    assert_prime_factors_for 2, are: [2]
  end

  it 'should return prime factors of 3' do
    assert_prime_factors_for 3, are: [3]
  end

  it 'should return prime factors of 4' do
    assert_prime_factors_for 4, are: [2,2]
  end

  it 'should return prime factors of 6' do
    assert_prime_factors_for 6, are: [2,3]
  end

  it 'should return prime factors of 8' do
    assert_prime_factors_for 8, are: [2,2,2]
  end

  it 'should return prime factors of 9' do
    assert_prime_factors_for 9, are: [3,3]
  end

  it 'should return prime factors of 24' do
    assert_prime_factors_for 24, are: [2,2,2,3]
  end

  it 'should return prime factors of 30' do
    assert_prime_factors_for 30, are: [2,3,5]
  end


  def assert_prime_factors_for(n, are: [])
    expect(PrimeFactor.new.generate n).to eq are
  end
end