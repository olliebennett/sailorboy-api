# SailorBoy API

[![Build Status](https://img.shields.io/travis/olliebennett/sailorboy-api.svg)](https://travis-ci.org/olliebennett/sailorboy-api)

[![Code Coverage](https://img.shields.io/codecov/c/github/olliebennett/sailorboy-api.svg)](https://codecov.io/github/olliebennett/sailorboy-api?branch=master)

# Setup

You'll need Ruby (version specified in the [Gemfile](Gemfile)) with [Bundler](http://bundler.io/), [PostgreSQL](http://www.postgresql.org/) and [Redis](http://redis.io/).

On Mac OS X, we suggest running [Thoughtbot's Laptop Script](https://github.com/thoughtbot/laptop) to sort all this out (and more).

Create PostgreSQL databases:

```
rake db:create:all
```

Install dependencies:

```
bundle install
```

Start server:

```
rails server
```
