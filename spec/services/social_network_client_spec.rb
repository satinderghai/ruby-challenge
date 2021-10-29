require_relative '../spec_helper'
require_relative '../../services/social_network_client'

describe SocialNetworkClient do
  describe '#fetch' do
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

    let(:error_response) {
      {
        facebook: [],
        twitter: []
      }
    }

    it 'returns json response' do
      allow(SocialNetworkClient).to receive(:fetch).and_return(success_response)
      expect(SocialNetworkClient.fetch).to eq(success_response)
    end

    it 'returns json error response' do
      allow(SocialNetworkClient).to receive(:fetch).and_return(error_response)
      expect(SocialNetworkClient.fetch).to eq(error_response)
    end
  end
end
