require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Assets should be precompiled for production (so we don't need the gems loaded then)
Bundler.require(*Rails.groups(assets: %w(development test)))

module Letterclick
  class Application < Rails::Application
    # Use factories instead of fixtures.
    config.generators do |g|
      g.fixture_replacement :factory_girl
    end
  end
end
