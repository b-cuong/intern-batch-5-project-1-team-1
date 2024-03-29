require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module InternBatch5Project1Team1
  class Application < Rails::Application
    config.load_defaults 5.2

    config.i18n.load_path += Dir[Rails.root.join("my", "locales", "*.{rb,yml}")]
    config.i18n.default_locale = :vi
  end
end
