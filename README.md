# Cronjob - Online Cron Job, Cron Job via JSON APis

Online Cron Jobs Guardiano is a web based API service for scheduled or recurring tasks (cron jobs). The API can be integrated into users' applications. Add new tasks via API and when the time comes, the API service will send an request to the url provided and the scheduled job starts. The API uses RESTful calls and responses are formatted in JSON.

Ruby 2.2.3

## Installation

Register an account on http://guardiano.pm and get a token

Add this line to your application's Gemfile:

```ruby
gem 'cronjob'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cronjob

## Usage

```ruby
Cronjob.configure do |config|
  config.token = 'token you get when registering an account on http://guardiano.pm'
end
```
```ruby
  # Create a cronjob
  Cronjob::Create.new(action: :get, url: 'http://yourapp.com/api/endpoing/cronjob1', params: 'something=true', cron: '* * * * *')

  # List all cronjobs
  Cronjob::List.new

  # Delete a cronjob
  Cronjob::Delete.new(id: CRONJOBID)

  # Edit a cronjob
  Cronjob::Edit.new(id: CRONJOBID, action: :get, url: 'http://yourapp.com/api/endpoing/cronjob1', params: 'something=true', cron: '* * * * *')

  # Show a cronjob
  Cronjob::Show.new(id: CRONJOBID)
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/lorenzosinisi/cronjob.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

