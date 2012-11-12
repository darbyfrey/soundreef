[![Build Status](https://travis-ci.org/darbyfrey/soundreef.png)](https://travis-ci.org/darbyfrey/soundreef)
[![Code Climate](https://codeclimate.com/badge.png)](https://codeclimate.com/github/darbyfrey/soundreef)

# Soundreef

A simple ruby interface to the Soundreef API

## Description

This library provides a simple interface around the Songs, Batches and Earnings endpoints in the Soundreef API

## Installation

Add this line to your application's Gemfile:

    gem 'soundreef'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install soundreef

## Usage

### Configuration

For Rails, just put this in an initializer.

    Soundreef.configure do |c|
      c.public_key = 'yourpublickey'
      c.private_key = 'yourprivatekey'
    end

## Endpoints
Currently, `Songs`, `Batches` and `Earnings` endpoints are supported.

## Songs
The Songs endpoint provies two interfaces: `list` and `get`.

**List Params**

* **batch_id** default = nil (optional)
* **page** default = 1 (optional)
* **per_page** default = 50 (optional)
* **status** default = nil (optional)

**Examples**

    >> response = Soundreef::Songs.list({:page => 2, :per_page => 100})

    >> response.keys
    => ["page", "per_page", "pages", "songs"] 

    >> response.songs.count
    => 100

    >> response.songs.first
    => #<Hashie::Mash artist="SOME ARTIST NAME" batch=547 created_date="2012-10-30 17:54:36" song_guid="de6f5208-22ba-11e2-b5a9-12313c0866d9" song_supplier_id=132013 status=3 title="SOME SONG NAME"> 

**Get Params**

* **song_guid** (required if song_supplier_id is nil)
* **song_supplier_id** (required if song_guid is nil)

**Examples**

    >> response = Soundreef::Songs.get({:song_guid => 'de6f5208-22ba-11e2-b5a9-12313c0866d9'})
    => #<Hashie::Mash artist="SOME ARTIST NAME" batch=547 created_date="2012-10-30 17:54:36" song_guid="de6f5208-22ba-11e2-b5a9-12313c0866d9" song_supplier_id=132013 status=3 title="SOME SONG NAME"> 

    >> response.keys
    => ["title", "artist", "batch", "created_date", "song_guid", "song_supplier_id", "status"] 

## Batches
The Batches endpoint provies two interfaces: `list` and `get`.

**List Params**

* **batch_id** default = nil (optional)
* **page** default = 1 (optional)
* **per_page** default = 50 (optional)
* **status** default = nil (optional)

**Examples**

    >> response = Soundreef::Batches.list({:per_page => 25})

    >> response.keys
    => ["page", "per_page", "pages", "batches"] 

    >> response.batches.count
    => 19

    >> response.batches.first
    => #<Hashie::Mash batch_id=583 created_date="2012-11-07 12:39:59" name="fofo" progress=1>

**Get Params**

* **batch_id** (required)

**Examples**

    ...

## Earnings
The Earnings endpoint provies one interface: `get`.

**Get Params**

* **song_guid** (required if song_supplier_id is nil)
* **song_supplier_id** (required if song_guid is nil)
* **year** default = nil (optional)
* **semester** default = nil (optional)
* **from_date** default = nil (optional)
* **to_date** default = nil (optional)

**Examples**

    ...


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
