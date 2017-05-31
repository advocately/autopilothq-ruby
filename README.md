# Autopilot API Ruby Client

Unofficial Ruby client for the [AutopilotHQ API](http://developers.autopilothq.com/).

## Installation

Add `gem 'autopilot', github: 'advocately/autopilothq-ruby'` to your application's Gemfile, and then run `bundle` to install.

## Configuration

To get started, you need to configure the client with your secret API key. If you're using Rails, you should add the following to new initializer file in `config/initializers/autopilot.rb`.

```ruby
require 'autopilot'
Autopilot.api_key = 'YOUR_API_KEY'
```

For further options, read the [advanced configuration section](#advanced-configuration).

**Note:** Your API key is secret, and you should treat it like a password. You can find your API key in your Autopilot [account settings](https://app.autopilothq.com/#settings/api).


Identifying a contact:

```ruby
# Identify (create/update) a contact
contact3 = Autopilot::Contact.identify({
  Email: 'test@example.com'
})
```

## <a name="advanced-configuration"></a> Advanced configuration & testing

The following options are configurable for the client:

```ruby
Autopilot.api_key
Autopilot.http_adapter # default: Autopilot::HTTPAdapter.new
```

By default, a shared instance of `Autopilot::Client` is created lazily in `Autopilot.shared_client`. If you want to create your own client, perhaps for test or if you have multiple API keys, you can:

```ruby
# Create an custom client instance, and pass as last argument to resource actions
client = Autopilot::Client.new(:api_key => 'API_KEY',
  :api_base_url => 'https://api2.autopilothq.com/v1',
  :http_adapter => Autopilot::HTTPAdapter.new)
metrics_from_custom_client = Autopilot::Contact.identify({}, client)

# Or, you can set Autopilot.shared_client yourself
Autopilot.shared_client = Autopilot::Client.new(:api_key => 'API_KEY',
  :api_base_url => 'https://api.autopilot.com/v1',
  :http_adapter => Autopilot::HTTPAdapter.new)
metrics_from_custom_shared_client = Autopilot::Contact.identify
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Run the tests (`rake test`)
4. Commit your changes (`git commit -am 'Add some feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
