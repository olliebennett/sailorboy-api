source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '4.2.5'

# PostgreSQL Database
gem 'pg'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# JSON APIs builder
gem 'jbuilder', '~> 2.0'

# Rack middleware to allow cross domain requests
gem 'rack-cors', require: 'rack/cors'

# RSpec Test Runner
gem 'rspec-rails'

# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use Puma as the app server
gem 'puma'

group :test do
  # Codecov.io Reporter
  gem 'codecov', require: false

  # RSpec output formatter
  gem 'fuubar'

  # Extra matchers for testing
  gem 'shoulda-matchers'
end

group :development, :test do
  gem 'byebug'
end

group :development do
  gem 'guard-rspec', require: false

  # Spring Rails App Pre-loader
  gem 'spring'
  gem 'spring-commands-rspec'

  gem 'web-console', '~> 2.0'
end
