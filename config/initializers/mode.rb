module Mode
  class Application < Rails::Application
    config.mode = config_for(:mode)
    if Rails.configuration.mode['mode'] == "frontend"
      config.backend = config_for(:backend)
    end
  end
end
