require_relative 'game'
require_relative 'rules'

class GameFactory
  def self.create
    Game.new [FizzBuzzRule.new, FizzRule.new, BuzzRule.new, DefaultRule.new]
  end
end
