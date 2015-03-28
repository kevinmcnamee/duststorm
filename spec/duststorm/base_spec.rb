require 'spec_helper'

module Duststorm
  describe Base do
    let(:duststorm) { Base.new('90.32', '-40.232', {}) }
    let(:forecast) { double(:forecast) }
    let(:api_response) { double(:api_response) }

    describe '#forecast' do
      before do
        allow(Forecast).to receive(:new) { forecast }
        allow(WeatherApi).to receive(:response) { api_response }
      end

      it 'initializes a Forecast object' do
        expect(Forecast).to receive(:new).with(api_response)

        duststorm.forecast
      end

      it 'returns a Forecast object' do
        expect(duststorm.forecast).to eq forecast
      end
    end
  end
end
