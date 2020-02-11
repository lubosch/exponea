module Exponea
  class Events < BaseApi
    def self.add_event(customer_id, event_type, properties = nil, batch = false, timestamp = nil)
      payload = { customer_ids: { registered: customer_id },
                  properties: properties,
                  event_type: event_type }
      payload = payload.merge(timestamp: timestamp.to_i) if timestamp
      return { name: 'customers/events', data: payload } if batch

      path = "/track/v2/projects/#{Exponea.config.project}/customers/events"
      response = post(path, payload)
      response
    end
  end
end
