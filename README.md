# RubyGems JSONP

[![Build Status](https://travis-ci.org/i2bskn/ruby_gems_jsonp.png?branch=master)](https://travis-ci.org/i2bskn/ruby_gems_jsonp)
[![Coverage Status](https://coveralls.io/repos/i2bskn/ruby_gems_jsonp/badge.png?branch=master)](https://coveralls.io/r/i2bskn/ruby_gems_jsonp?branch=master)
[![Code Climate](https://codeclimate.com/github/i2bskn/ruby_gems_jsonp.png)](https://codeclimate.com/github/i2bskn/ruby_gems_jsonp)
[![Dependency Status](https://gemnasium.com/i2bskn/ruby_gems_jsonp.png)](https://gemnasium.com/i2bskn/ruby_gems_jsonp)

The wrapper of RubyGems API for JSONP.

#### Application on Heroku

[http://rubygems-jsonp.herokuapp.com](http://rubygems-jsonp.herokuapp.com)

## Installation

Clone from Github and bundle:

    git clone git://github.com/i2bskn/ruby_gems_jsonp.git
    cd ruby_gems_jsonp
    bundle install --path .bundle --without development test

## Run

    foreman start

## Deploy

#### for Heroku

```
heroku create
git push heroku master
heroku open
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
