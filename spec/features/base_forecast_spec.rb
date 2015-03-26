require 'spec_helper'

describe 'Base Forecast' do
  let(:lat) { '37.8267' }
  let(:lng) { '-122.423' }
  let(:options) { {} }

  let(:duststorm) { Duststorm.new(lat, lng, options) }

  before do
    Duststorm.config = { some_forecast: '624cfe2825b050265988ad8b9a97a915' }
  end

  it 'makes a forecast call' do
    VCR.use_cassette('forecast_for_latitude_longitude', record: :once) do
      forecast = duststorm.forecast

      expect(forecast).to be_a(Duststorm::Forecast::Base)

      expect(forecast).to_not be_nil
      expect(forecast.latitude).to eq(37.8267)
      expect(forecast.longitude).to eq(-122.423)

      expect(forecast.currently).to be_a(Duststorm::Weather::Current)

      expect(forecast.hourly.size).to eq(49)
      expect(forecast.hourly.first).to be_a(Duststorm::Weather::Hourly)

      expect(forecast.daily.size).to eq(8)
      expect(forecast.daily.first).to be_a(Duststorm::Weather::Daily)
    end
  end
end
