class PrimeFactor
  def generate(number)
    (2..number).to_a.inject([]) do |primes, factor|
      while number % factor == 0
        number = number / factor
        primes << factor
      end
      primes
    end
  end
end