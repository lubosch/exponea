require 'spec_helper'

RSpec.describe Exponea::BaseApi do
  describe '.request' do
    subject { described_class.request('/url', 'PUT', data: []) }
    it 'sends request to exponea' do
      stub_request(:put, 'https://api.exponea.com/url')
        .with(
          body: '{"data":[]}',
          headers: {
            'Authorization' => 'Basic k324m3k',
            'Content-Type' => 'application/json'
          }
        ).and_return(body: '{ "errors": [], "success": true }')
      expect(subject['success']).to be_truthy
    end
  end

  describe '.batch_commands' do
    subject { described_class.batch_commands(['command 1', 'command 2']) }
    it 'sends batch request to exponea' do
      stub_request(:post, 'https://api.exponea.com/track/v2/projects/123/batch')
        .with(
          body: '{"commands":["command 1","command 2"]}',
          headers: {
            'Authorization' => 'Basic k324m3k',
            'Content-Type' => 'application/json'
          }
        ).and_return(body: '{"results": [{ "errors": [], "success": true }, { "errors": [], "success": true }], "success": true}')
      expect(subject).to all(be_truthy)
    end
  end
end
