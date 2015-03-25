require 'spec_helper'

describe Duststorm::Base do
  let(:duststorm) { Duststorm::Base.new('90.32', '-40.232', options) }
  let(:options) { {} }

  describe '#forecast' do
    let(:faraday) { double(:faraday, get: response) }
    let(:response) { {some: :response} }

    around do |example|
      cached_config = Duststorm.config
      example.run
      Duststorm.config = cached_config
    end

    before do
      Duststorm.config = { some_forecast: '12345' }
      allow(Faraday).to receive(:new) { faraday }
    end

    it "sends through a standard request" do
      expect(faraday).to receive(:get).with(
        'https://api.forecast.io/forecast/12345/90.32,-40.232', {}
      ).and_return(response)

      duststorm.forecast
    end
  end
end
