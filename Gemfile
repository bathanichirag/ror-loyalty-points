source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
# managing environment
gem 'dotenv-rails', require: 'dotenv/rails-now'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '= 6.0.1'

# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 4.3.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
#gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
gem 'jquery-rails'
gem 'turbolinks'
# gem 'rack-attack', '~> 6.1.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  #faker to generate fake data for testing and development purpose
  gem 'faker'

  # gem "capybara"
  gem 'rspec-rails', '~> 3.5'
  # gem 'rubocop-performance'

end
group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'debase'
end

group :test do
  gem 'factory_bot_rails', '~> 4.0'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

## fast http request
# gem 'typhoeus'
gem 'oj'
gem 'fast_blank'
gem "webpacker"
# Use Json Web Token (JWT) for token based authentication
# gem 'jwt'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# gem 'omniauth-oauth2', '~> 1.3.1'
# gem "omniauth-google-oauth2", "~> 0.2.1"
# gem 'redis'
# gem 'redis-namespace'
# gem 'redis-rails'
# gem 'redis-rack-cache'
# gem 'redis-objects'
# gem 'cached_resource'
# gem 'actionpack-action_caching'

# # #elasticsearch related gems
# gem 'elasticsearch-model'
# gem 'elasticsearch-persistence'
# gem 'elasticsearch-rails'
# gem 'searchkick'
# gem 'swiftype-app-search'
# gem 'searchjoy'

# gem 'chewy'

#json serailser  by netflix
# gem 'fast_jsonapi'

## gen related to pagination and filters
gem 'active_model_serializers', '~> 0.10.0'
gem 'will_paginate', '~> 3.1.0'
gem 'has_scope'

# gem 'active_model_serializers'

# Ruby client for RabbitMQ (3.3+)
gem "bunny", ">= 2.14.1"

#background process queuse with rabbitmq
gem 'sneakers'
gem "sneakers_packer", "~> 0.1.5"

#for recurring and delayed jobs
# gem 'sidekiq', "~>5.2.7"
# gem 'sidekiq-cron'

#gem related to swagger implementation
# https://github.com/fotinakis/swagger-blocks
gem 'swagger-blocks'

#translation related gems
gem 'rails-i18n'
gem 'activerecord'
# gem 'mobility'
#gem 'bullet', group: 'development'
# gem for QR Code
# gem 'rqrcode', '~> 0.10.1'

# gem "rgeo"
# gem "rgeo-activerecord", '~> 5.0'
# gem 'activerecord-mysql2spatial-adapter'
# gem 'armg'

#converting QR code in png
# gem 'rqrcode_png', '~> 0.1.5'

#gem for converting QR code in pdf
# gem 'wicked_pdf'

### import data in bulk
gem 'activerecord-import'
### adding concurrency in the job
gem 'activejob-traffic_control'
# Dinenow Core module for the microservice setup
# gem "dinenow" #, :path => './vendor/dinenow-core/'
# gem "image_processing", "~> 1.9"
#gem for storing images in cache
# gem "fog"
#gem "fog-aws"

# gem 'carrierwave', '~> 2.0'
# # gem 'carrierwave-imageoptimizer'
# gem 'carrierwave-aws'
# gem 'carrierwave-video'
# gem 'carrierwave-video-thumbnailer'
# gem 'carrierwave-ffmpeg'

# gem 'aws-sdk-s3', '~> 1.0.0'
#gem "cloudfront-signer", "~> 3.0"

# gem 'geoip4rails'
gem 'mysql-binuuid-rails'

# Health check
# gem 'health_check', '~> 2.6.0'
# gem "lograge"

# Attribute encryption
gem "attr_encrypted", "~> 3.1.0"
gem "blind_index"

group :development do
  gem 'rack-mini-profiler'
# For memory profiling
  gem 'memory_profiler'
  gem "derailed_benchmarks"
# For call-stack profiling flamegraphs
#   gem 'flamegraph'
#   gem 'stackprof'

#   gem 'random-location'
## log monitoring tool elastic##
# gem 'elastic-apm'
# gem 'lograge'
# gem 'logstash-event'
# gem 'logstash-logger'

  gem 'bullet'
  #gem 'scout_apm'

  #To check security vulnerabilities
  gem 'brakeman'
end

#gem 'silencer', '~> 1.0.1' # for silence logger for particular url

gem "dry-validation", "~> 1.3"

gem 'rest-client'

gem 'connection_pool'

#static code analyzer
# gem 'rubocop-rails', require: false

#put this as low as possible so that new relic can monitor all gems performanee
#new relic gem
# gem 'newrelic_rpm'
# gem 'scout_apm'



