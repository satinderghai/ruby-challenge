require_relative 'spec_helper'
require_relative '../app'
require_relative '../services/social_network_client'
require "rack/test"

describe App do
  describe '#root' do
  	include Rack::Test::Methods

  	let(:success_response) {
      {
        facebook: [
          {
            "name":"Some Friend",
            "status":"Here's some photos of my holiday. Look how much more fun I'm having than you are!"
          },
          {
            "name":"Drama Pig",
            "status":"I am in a hospital. I will not tell you anything about why I am here."
          }
        ],
        twitter: [
          {
            "username":"@GuyEndoreKaiser",
            "tweet":"If you live to be 100, you should make up some fake reason why, just to mess with people... like claim you ate a pinecone every single day."
          },
          {
            "username":"@mikeleffingwell",
            "tweet":"STOP TELLING ME YOUR NEWBORN'S WEIGHT AND LENGTH I DON'T KNOW WHAT TO DO WITH THAT INFORMATION."
          }
        ]
      }
    }

  	def app
      app = lambda { |env| [200, { 'Content-Type' => 'application/json' }, success_response.to_s] }
      builder = Rack::Builder.new
      builder.run app
  	end

  	it 'returns json response' do
      get '/'
      expect(last_response.status).to eq 200
      expect(last_response.body).to eq success_response.to_s
    end
  end
end
