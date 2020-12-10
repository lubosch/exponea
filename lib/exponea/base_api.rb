module Exponea
  class BaseApi
    EXPONEA_URL = 'https://api.exponea.com'.freeze

    def self.request(uri, method = 'POST', payload = nil)
      client = Faraday.new(url: EXPONEA_URL) do |faraday|
        faraday.request :json
        faraday.response :json

        faraday.adapter Faraday.default_adapter
      end

      response = client.send(method.downcase.to_sym) do |request|
        request.headers['authorization'] = "Basic #{Exponea.config.token}"
        request.url(uri)
        request.body = payload
      end
      response.body
    end

    def self.batch_commands(commands)
      responses = []
      commands.each_slice(50) do |command_batch|
        path = "track/v2/projects/#{Exponea.config.project}/batch"
        payload = { commands: command_batch }
        response = post(path, payload)
        response = post(path, payload) unless response['success'] # retry if exponea failed for some reason

        next unless response['success']

        response['results'].each { |result| responses.push(response['time'] ? result['time'] : result['success']) }
      end
      responses
    end

    def self.get(path)
      request(path, 'GET')
    end

    def self.post(path, payload)
      request(path, 'POST', payload)
    end

    def self.delete(path, payload)
      request(path, 'DELETE', payload)
    end

    def self.put(path, payload)
      request(path, 'PUT', payload)
    end
  end
end
