if Rails.env == "development"
  Rails.application.config.session_store :cookie_store, key: "_rails_app"
else
  Rails.application.config.session_store :cookie_store, key: "_rails_app", domain: "example.com"
end
