require_relative 'base'

class Twitter < Base
  def self.tweets
  	fetch("twitter")
  end
end
