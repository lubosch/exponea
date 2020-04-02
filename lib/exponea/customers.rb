module Exponea
  class Customers < BaseApi
    def self.update_properties(customer_id, properties, batch = false)
      customer_ids = customer_id.is_a?(Hash) ? customer_id : { registered: customer_id }
      payload = { customer_ids: customer_ids, properties: properties }
      return { name: 'customers', data: payload } if batch

      path = "/track/v2/projects/#{Exponea.config.project}/customers"
      post(path, payload)
    end

    # def self.customer(ids)
    #   path = "/data/v2/projects/#{Exponea.config.project}/customers/export-one"
    #   payload = { customer_ids: ids }
    #   post(path, payload)
    # end

    # def customer_consents(ids, consents)
    #   path = "/data/v2/projects/#{Exponea.config.project}/customers/attributes"
    #   payload = { customer_ids: ids,
    #               attributes: consents.map { |consent| { type: 'consent', category: consent } } }
    #   post(path, payload)
    # end

    # def customer_attributes(customer_ids, properties: [], segmentations: [], ids: [], expressions: [], aggregations: [], predictions: [])
    #   path = "/data/v2/projects/#{Exponea.config.project}/customers/attributes"
    #   payload = {
    #     customer_ids: customer_ids,
    #     attributes:
    #       properties.map { |property| { type: 'property', property: property } } +
    #         segmentations.map { |segment| { type: 'segmentation', id: segment } } +
    #         ids.map { |id| { type: 'id', id: id } } +
    #         expressions.map { |expression| { type: 'expression', id: expression } } +
    #         aggregations.map { |aggregate| { type: 'aggregate', id: aggregate } } +
    #         predictions.map { |prediction| { type: 'prediction', id: prediction } }
    #   }
    #   post(path, payload)
    # end

    # def self.customers
    #   path = "/data/v2/projects/#{Exponea.config.project}/customers/export"
    #   payload = { format: 'native_json' }
    #   users = []
    #   response = post(path, payload)
    #   response['fields'].filter {|field| field['type'] == 'id'}
    # end

    # def self.events(customer_ids, event_types)
    #   path = "/data/v2/projects/#{Exponea.config.project}/customers/events"
    #   payload = { customer_ids: customer_ids, event_types: event_types }
    #   response = post(path, payload)
    # end

    # def self.anonymize_customer(customer_ids)
    #   path = "/data/v2/projects/#{Exponea.config.project}/customers/anonymize"
    #   payload = { customer_ids: customer_ids }
    #   response = post(path, payload)
    # end
  end
end
