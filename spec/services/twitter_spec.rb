require_relative '../spec_helper'
require_relative '../../services/twitter'

describe Twitter do
  describe '#tweets' do
    let(:success_response) {
      [
        {
          "username":"@GuyEndoreKaiser",
          "tweet":"If you live to be 100, you should make up some fake reason why, just to mess with people... like claim you ate a pinecone every single day."
        },
        {
          "username":"@mikeleffingwell",
          "tweet":"STOP TELLING ME YOUR NEWBORN'S WEIGHT AND LENGTH I DON'T KNOW WHAT TO DO WITH THAT INFORMATION."
        }
      ].to_json
    }

    let(:error_response) {
      'I am trapped in a social media factory send help'
    }

    it 'returns json response' do
      allow(Twitter).to receive(:tweets).and_return(success_response)
      expect(Twitter.tweets).to eq(success_response)
    end

    it 'returns json error response' do
      allow(Twitter).to receive(:tweets).and_return(error_response)
      expect(Twitter.tweets).to eq(error_response)
    end
  end
end
