require_relative 'base'

class Facebook < Base
  def self.statuses
  	fetch("instagram")
  end
end
