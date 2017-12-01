module FixnumExtension
  refine Fixnum do
    def is_multitple_of?(n)
      self % n == 0
    end
  end
end

class DefaultRule
  def can_handle?(n)
    true
  end

  def say(n)
    n.to_s
  end
end

class FizzRule
  using FixnumExtension

  def can_handle?(n)
    n.is_multitple_of? 3
  end

  def say(n)
    'FIZZ'
  end
end

class BuzzRule
  using FixnumExtension

  def can_handle?(n)
    n.is_multitple_of? 5
  end

  def say(n)
    'BUZZ'
  end
end

class FizzBuzzRule
  using FixnumExtension

  def can_handle?(n)
    n.is_multitple_of? 5 and n.is_multitple_of? 3
  end

  def say(n)
    'FIZZBUZZ'
  end
end