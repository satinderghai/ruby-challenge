require_relative '../errors/json_response_not_available_error'
require 'httpx'
require 'json'

class Base
  TAKEHOME_URL = "https://takehome.io/"

  def self.fetch(pathname)
  	response = HTTPX.get(TAKEHOME_URL + pathname)
    raise JSONResponseNotAvailableError, 'JSON response not available' unless response.status == 200
    JSON.parse(response.body)
  rescue JSONResponseNotAvailableError => exception
  	[]
  end
end
