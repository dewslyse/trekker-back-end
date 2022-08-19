if Rails.env == "production"
  Rails.application.config.session_store :cookie_store, key: "_authentication_app", domain: "mv-trekker-api.herokuapp.com/api/v1"
else
  Rails.application.config.session_store :cookie_store, key: "_authentication_app"
end