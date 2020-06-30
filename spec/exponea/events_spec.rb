require 'spec_helper'

RSpec.describe Exponea::Events do
  describe '.add_event' do
    subject { described_class.add_event('3423423', 'demand_open', first_name: 'John') }
    it 'sends request to exponea' do
      stub_request(:post, "https://api.exponea.com/track/v2/projects/#{Exponea.config.project}/customers/events")
        .with(
          body: { "customer_ids": { "registered": '3423423' }, "properties": { "first_name": 'John' }, "event_type": 'demand_open' },
          headers: {
            'Authorization' => "Basic #{Exponea.config.token}",
            'Content-Type' => 'application/json'
          }
        ).and_return(body: '{ "errors": [], "success": true }')
      expect(subject['success']).to be_truthy
    end

    context 'when sending batch' do
      subject { described_class.add_event('3423423', 'demand_open', { first_name: 'John' }, true) }
      it 'returns just data' do
        expect(subject).to eq(name: 'customers/events', data: { customer_ids: { registered: '3423423' },
                                                                properties: { first_name: 'John' }, event_type: 'demand_open' })
      end
    end

    context 'when using multiple ids' do
      subject { described_class.add_event({ registered: '3423423', device_id: 'unique_id' }, 'demand_open', { first_name: 'John' }) }
      it 'sends request to exponea' do
        stub_request(:post, "https://api.exponea.com/track/v2/projects/#{Exponea.config.project}/customers/events")
          .with(
            body: {
              "customer_ids": { registered: '3423423', device_id: 'unique_id' }, "properties": { "first_name": 'John' }, "event_type": 'demand_open'
            },
            headers: {
              'Authorization' => "Basic #{Exponea.config.token}",
              'Content-Type' => 'application/json'
            }
          ).and_return(body: '{ "errors": [], "success": true }')
        expect(subject['success']).to be_truthy
      end
    end
  end
end
