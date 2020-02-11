require 'spec_helper'

RSpec.describe Exponea::Customers do
  describe '.update_properties' do
    subject { described_class.update_properties('3423423', first_name: 'John') }
    it 'sends request to exponea' do
      stub_request(:post, "https://api.exponea.com/track/v2/projects/#{Exponea.config.project}/customers")
        .with(
          body: { "customer_ids": { "registered": '3423423' }, "properties": { "first_name": 'John' } },
          headers: {
            'Authorization' => "Basic #{Exponea.config.token}",
            'Content-Type' => 'application/json'
          }
        ).and_return(body: '{ "errors": [], "success": true }')
      expect(subject['success']).to be_truthy
    end
  end

  context 'when sending batch' do
    subject { described_class.update_properties('3423423', { first_name: 'John' }, true) }
    it 'returns just data' do
      expect(subject).to eq(name: 'customers', data: { customer_ids: { registered: '3423423' }, properties: { first_name: 'John' } })
    end
  end
end
