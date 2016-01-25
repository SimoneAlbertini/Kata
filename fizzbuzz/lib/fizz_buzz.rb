class FizzBuzz
  def generate(number)
    result = ''
    result << 'FIZZ' if number % 3 == 0
    result << 'BUZZ' if number % 5 == 0
    result << 'BANG' if number % 7 == 0
    result
  end
end