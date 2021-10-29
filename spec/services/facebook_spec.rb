require_relative '../spec_helper'
require_relative '../../services/facebook'

describe Facebook do
  describe '#statuses' do
    let(:success_response) {
      [
        {
          "name":"Some Friend",
          "status":"Here's some photos of my holiday. Look how much more fun I'm having than you are!"
        },
        {
          "name":"Drama Pig",
          "status":"I am in a hospital. I will not tell you anything about why I am here."
        }
      ].to_json
    }

    let(:error_response) {
      'I am trapped in a social media factory send help'
    }

    it 'returns json response' do
      allow(Facebook).to receive(:statuses).and_return(success_response)
      expect(Facebook.statuses).to eq(success_response)
    end

    it 'returns json error response' do
      allow(Facebook).to receive(:statuses).and_return(error_response)
      expect(Facebook.statuses).to eq(error_response)
    end
  end
end
