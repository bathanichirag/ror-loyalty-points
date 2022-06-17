require_relative 'boot'

require "rails"
# require "dinenow"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"
require "sprockets/railtie"
# require "mobility"
# require 'elasticsearch/rails/instrumentation'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
Dotenv::Railtie.load

module App
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

#     config.app_name = ENV.fetch('APP_NAME') {'Dinenow'}
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
#     config.debug_exception_response_format = :api
    #config.autoload_paths << "#{Rails.root}/lib"
    #config.autoload_paths << "#{Rails.root}/app/clients/publishers"
    config.autoload_paths << "#{Rails.root}/clients"
    #config.eager_load_paths << Rails.root.join('lib')
    #config.middleware.use Rack::Attack
    config.action_dispatch.use_cookies_with_metadata = true

#     config.active_job.queue_adapter = :sneakers
#     config.active_job.queue_name = 'default'
#     config.active_job.queue_name_prefix = Rails.env.to_s+"-restaurant"

    # Register our custom scaffold controller in rails
    config.generators do |g|
      g.scaffold_controller :my_scaffold_controller
      g.resource_route :my_resource_route
    end
  end
end
