[![Build Status](https://travis-ci.com/lubosch/exponea.svg?branch=master)](https://travis-ci.com/lubosch/exponea)
[![Coverage Status](https://codecov.io/gh/lubosch/exponea/branch/master/graph/badge.svg)](https://codecov.io/gh/lubosch/exponea)

# Exponea

Gem for creating or updating customers in Exponea and triggering events in single or batch mode.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'exponea'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install exponea

## Configuration

```
Exponea.configure do |config|
  config.project = Rails.application.config_for(:exponea)[:project]
  config.token = Rails.application.config_for(:exponea)[:token]
  config.api_secret = Rails.application.config_for(:exponea)[:api_secret]
end
```

Initialize `exponea.rb` with this settings:
- **project**: project id from exponea
- **token**: token generated from exponea
- **api_secret**(optional): secret API you can use in controllers to authorize requests from exponea to your app

## Usage

### Create or update customer
```
Exponea::Customers.update_properties(customer_id, properties, batch = false)
```
- **customer_id**: use either `registered` id or hash with one of your id
- **properties**: hash of properties to be updated
- **batch**: returns hash that can be sent as batch

### Add event
```
Exponea::Events.add_event(customer_id, event_type, properties = nil, batch = false, timestamp = nil)`
```
- **customer_id**: use either `registered` id or hash with one of your id
- **event_type**: event name defined in exponea
- **batch**: returns hash that can be sent as batch
- **timestamp**: modified timestamp of event if needed

### Batch events
```
Exponea::BaseApi.batch_commands(commands)
```

- **commands**: list of commands created with `batch = true`. They are sent in batches of 50 (exponea limitation)

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lubosch/exponea.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
