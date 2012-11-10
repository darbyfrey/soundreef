# Soundreef

A ruby wrapper around the Soundreef API

## Installation

Add this line to your application's Gemfile:

    gem 'soundreef'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install soundreef

## Usage

    Soundreef.configure do |c|
      c.public_key = 'yourpublickey'
      c.private_key = 'yourprivatekey'
    end

    params = {
      :page => 1,
      :per_page => 20,
      :status => 1
    }

    s=Soundreef::Request.new(params)
    s.response.body

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
