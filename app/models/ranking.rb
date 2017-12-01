require 'singleton'

class RankingEvaluation

  attr_reader :name, :value

  def initialize(name, value)
    @name = name
    @value = value
  end

end

class Ranking

  include Singleton

  def initialize
    @options = [ ['Nothing', -1], ['Perfect', 4], ['Excellent', 3], ['Good', 2], ['Fair', 1], ['Bad', 0] ]
  end

  def rankings
    @rankings ||= @options.map { |option| RankingEvaluation.new(option[0], option[1]) }
  end
end
