module Backend
  class Application < Rails::Application
    config.app_version = config_for(:app_version)
  end
end
