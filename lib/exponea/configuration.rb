module Exponea
  class Configuration
    attr_accessor :project, :token, :api_secret

    def initialize
      @project = ENV['EXPONEA_PROJECT']
      @token = ENV['EXPONEA_TOKEN']
      @api_secret = ENV['EXPONEA_API_SECRET']
    end
  end
end
