require_relative "boot"

require "rails/all"
require "jwt"

Bundler.require(*Rails.groups)

module SchoolApi
  class Application < Rails::Application
    config.load_defaults 7.2
    config.api_only = true
  end
end