require_relative 'twitter'
require_relative 'facebook'

class SocialNetworkClient
  def self.fetch
  	{
      twitter: Twitter.tweets,
      facebook: Facebook.statuses
    }
  end
end
