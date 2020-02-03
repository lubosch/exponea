require "faraday"
require 'faraday_middleware'

require "exponea/base_api"
require "exponea/configuration"
require "exponea/customers"
require "exponea/events"
require "exponea/version"

module Exponea
  @@configuration ||= Configuration.new

  def self.config
    @@configuration ||= Configuration.new
  end

  def self.configure
    @@configuration ||= Configuration.new
    yield(@@configuration)
  end

  class Error < StandardError; end
end
