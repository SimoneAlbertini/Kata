class FizzBuzz
  def generate(number)
    rules.inject('') do |result, rule|
      result << rule.call(number)
    end
  end

  def rules
    [
     rule(3, 'FIZZ'),
     rule(5, 'BUZZ'),
     rule(7, 'BANG')
    ]
  end

  private

  def rule(divider, message)
    ->(n) { n % divider == 0 ? message : '' }
  end
end