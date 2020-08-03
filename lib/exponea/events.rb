module Exponea
  class Events < BaseApi
    def self.add_event(customer_id, event_type, properties = nil, batch = false, timestamp = nil)
      customer_ids = customer_id.is_a?(Hash) ? customer_id : { registered: customer_id }
      payload = { customer_ids: customer_ids,
                  properties: properties,
                  event_type: event_type }
      payload = payload.merge(timestamp: timestamp.to_i) if timestamp
      return { name: 'customers/events', data: payload } if batch

      path = "/track/v2/projects/#{Exponea.config.project}/customers/events"
      post(path, payload)
    end
  end
end
