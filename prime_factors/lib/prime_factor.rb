class PrimeFactor
  def initialize
    @primes = []
  end

  def generate(xxx)
    number = xxx
    (2..xxx).to_a.each do |factor|
      number = factor_of(factor, number)
    end

    @primes
  end

  private

  def factor_of(factor, number)
    num = number
    while num % factor == 0
      @primes << factor
      num = num / factor
    end
    num
  end
end