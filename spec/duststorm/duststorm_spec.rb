require 'spec_helper'

describe Duststorm do
  describe '#new' do
    before do
      allow(Duststorm::Base).to receive(:new)
    end

    it 'delegates the call to Base class' do
      expect(Duststorm::Base).to receive(:new).with('args')
      Duststorm.new('args')
    end
  end

  describe '.config' do
    it 'does not have a default value' do
      expect( Duststorm.config ).to be nil
    end

    it 'sets a value' do
      Duststorm.config = { forecast: 'api-key' }
      expect( Duststorm.config ).to eq({ forecast: 'api-key' })
    end
  end
end
