require 'spec_helper'

describe Duststorm::Base do
  let(:duststorm) { Duststorm::Base.new('90.32', '-40.232', options) }
  let(:options) { {} }

  describe '#forecast' do
    let(:faraday) { double(:faraday, get: response) }
    let(:response) { double(:response, body: {}) }

    before do
      Duststorm.config = { some_forecast: '12345' }
      allow(Faraday).to receive(:new) { faraday }
      allow(Duststorm::Forecast).to receive(:new).with(response)
    end

    it "sends through a standard request" do
      expect(faraday).to receive(:get).with(
        'https://api.forecast.io/forecast/12345/90.32,-40.232', {}
      ).and_return(response)

      duststorm.forecast
    end

    it 'instantiates a new forecast with response' do
      expect(Duststorm::Forecast).to receive(:new).with(response.body)
    end
  end
end
