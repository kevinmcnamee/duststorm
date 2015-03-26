require 'spec_helper'

module Duststorm
  describe Base do
    let(:duststorm) { Base.new('90.32', '-40.232', options) }
    let(:options) { {} }

    describe '#forecast' do
      let(:faraday) { double(:faraday, get: response) }
      let(:response) { double(:response, success?: true, body: MultiJson.dump({})) }

      before do
        allow(Faraday).to receive(:new) { faraday }
        allow(Forecast).to receive(:new).with(json_response)

        Duststorm.config = { some_forecast: '12345' }
      end

      it "sends through a standard request" do
        expect(faraday).to receive(:get).with(
          'https://api.forecast.io/forecast/12345/90.32,-40.232', {}
        ).and_return(response)

        duststorm.forecast
      end

      it 'instantiates a new forecast with response' do
        expect(Forecast).to receive(:new).with(json_response)
        duststorm.forecast
      end
    end

    def json_response
      MultiJson.load(response.body, symbolize_keys: true)
    end
  end
end
