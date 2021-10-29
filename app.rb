require "roda"
require_relative 'services/social_network_client'

class App < Roda
  plugin :json

  route do |r|
    r.root do      
      ::SocialNetworkClient.fetch
    end
  end
end
