require 'faraday'

require 'exponea/base_api'
require 'exponea/configuration'
require 'exponea/customers'
require 'exponea/events'
require 'exponea/version'

module Exponea
  @configuration = Configuration.new

  def self.config
    @configuration
  end

  def self.configure
    yield(@configuration)
  end

  class Error < StandardError
  end
end
