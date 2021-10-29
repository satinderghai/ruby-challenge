require_relative '../spec_helper'
require_relative '../../services/base'

describe Base do
  describe '#fetch' do
    let(:error_response) {
      'I am trapped in a social media factory send help'
    }

    it 'returns error if trying to fetch data from the Social Network without argument' do
      expect { Base.fetch }.to raise_error(ArgumentError)
    end

    it 'returns error if trying to fetch data from the Social Network' do
      allow(Base).to receive(:fetch).and_raise(JSONResponseNotAvailableError)
      expect{ Base.fetch('twitter') }.to raise_error(JSONResponseNotAvailableError)
    end
  end
end
