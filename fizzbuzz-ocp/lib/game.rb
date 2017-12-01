class Game
  def initialize(rules)
    @rules = rules
  end

  def say(n)
    @rules.each do |rule|
      return rule.say(n) if rule.can_handle?(n)
    end
  end
end