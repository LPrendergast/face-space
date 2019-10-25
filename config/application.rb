require_relative 'boot'

require 'rails/all'

require 'RSpotify'

RSpotify::authenticate("2ba1b7bb2dd9448ab9ae4c7614d95728", "348bf5615fe34fb88c88508b215bc649")

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FaceSpace
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
