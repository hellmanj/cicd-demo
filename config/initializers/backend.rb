module Backend
  class Application < Rails::Application
    config.backend = config_for(:backend)
  end
end
