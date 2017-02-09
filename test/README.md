# ApiBankin

This is a Ruby library to easy use bankin API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'api_bankin'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install api_bankin

## Usage

Firstly you need to register an account to bankin API, than when you got the client_id and client_secret provided by bankin, you can start using api_bankin gem.

## Example

```ruby

require "api_bankin"

# Create a new request session. First time you need to enter the client_id and client_secret.
# params are save in Bankin::Request class for later usages.
bankin = Bankin::Request.new(client_id, client_secret)


# Create a new user is simple
# You just need email, password params
# the method return you a hash with 3 params, code, body and message.
res = bankin.post.create_user(email, password)

# RESPONSE CODE
puts res['code'].to_s

# RESPONSE BODY
puts res['body'].to_s

# RESPONSE MESSAGE
puts res['message'].to_s

# Authenticate an user
# One more time, you just need to add email, password parameters.
res = bankin.post.authenticate_user(email, password)

# this time you need to JSON parse the body, for use or store data.
require "json"

json_res = JSON.parse(res['body'])

# RESPONSE TOKEN
puts  user_token = json_res['access_token']

# RESPONSE UUID
puts  user_uuid = json_res['user']['uuid']

# RESPONSE RESSOURCE_URI
puts  user_ressource_uri = json_res['user']['resource_uri']

# RESPONSE RESSOURCE_TYPE
puts  user_ressource_type = json_res['user']['resource_type']

# RESPONSE EMAIL
puts  user_email = json_res['user']['email']

# Looks documentation for method, params, usages.

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/api_bankin. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
