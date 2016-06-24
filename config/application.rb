require_relative 'boot'

require "rails"

require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Kane
  class Application < Rails::Application
    config.active_record.schema_format = :sql
    config.generators do |g|
      g.factory_girl dir: 'spec/factories'
    end
  end
end
