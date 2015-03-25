require 'duststorm/version'
require 'duststorm/base'

require 'hashie'
require 'multi_json'
require 'faraday'

module Duststorm
  # Dustorm.config = { forecast_api: :api_key }
  def self.config=(config)
    @@config = config
  end

  def self.config
    @@config ||= nil
  end

  def self.new(*args)
    Duststorm::Base.new(*args)
  end
end
