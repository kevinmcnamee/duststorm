require 'spec_helper'

describe 'ForecastIo forecast' do
  let(:lat) { '37.8267' }
  let(:lng) { '-122.423' }
  let(:options) { {} }

  let(:forecast) { Duststorm.new(lat, lng, options).forecast }

  before do
    Duststorm.config = weather_service_config
  end

  around(:each) do |example|
    VCR.use_cassette(vcr_cassette, record: :once) do
      example.run
    end
  end

  describe 'forecast_io response' do
    let(:vcr_cassette) { 'forecast_for_forecast_io' }

    let(:weather_service_config) { { forecast_io: 'some-api-key' } }
    let(:weather_services_response) do
      Duststorm::WeatherApi::ForecastIo.new(lat, lng, options).execute
    end


    it 'maps the proper attributes' do
      expect_proper_api_mapping
    end

    it 'sets the proper weather types' do
      expect_proper_weather_types
    end
  end

  xdescribe 'wunderground response' do
    let(:vcr_cassette) { 'forecast_for_wunderground' }

    let(:weather_service_config) { { wunderground: '' } }
    let(:weather_services_response) do
      Duststorm::WeatherApi::Wunderground.new(lat, lng, options).execute
    end

    it 'maps the proper attributes' do
      expect_proper_api_mapping
    end

    it 'sets the proper weather types' do
      expect_proper_weather_types
    end
  end

  private

  def expect_proper_api_mapping
    expect(forecast.latitude).to eq(37.8267)
    expect(forecast.longitude).to eq(-122.423)

    expect(forecast.currently.temperature).to eq(
      weather_services_response[:currently][:temperature]
    )

    expect(forecast.hourly.size).to eq(
      weather_services_response[:hourly].size
    )

    expect(forecast.daily.size).to eq(
      weather_services_response[:daily].size
    )
  end

  def expect_proper_weather_types
    expect(forecast).to be_a(Duststorm::Forecast::Base)
    expect(forecast.currently).to be_a(Duststorm::Weather::Current)
    expect(forecast.hourly.first).to be_a(Duststorm::Weather::Hourly)
    expect(forecast.daily.first).to be_a(Duststorm::Weather::Daily)
  end
end
