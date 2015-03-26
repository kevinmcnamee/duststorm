require 'spec_helper'

module Duststorm
  module Weather
    describe Hourly do
      let(:hourly_hash) do
        {
          time: 1427320800,
          summary: "Clear",
          precipIntensity: 0,
          precipProbability: 0,
          temperature: 64.78,
          apparentTemperature: 64.78,
        }
      end

      let(:hourly) { Hourly.new(hourly_hash) }

      describe '#attributes' do
        it 'has the proper attributes' do
          expect(hourly.time).to eq Time.at(1427320800)
          expect(hourly.precipitation).to eq 0.0
          expect(hourly.temperature).to eq 64.78
        end
      end
    end
  end
end
