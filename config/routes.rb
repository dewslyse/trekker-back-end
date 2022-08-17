Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # Redirects root path to api-docs path
  get '/' => redirect('/api-docs')
  
  namespace :api do
    namespace :v1 do
      resources :destinations do
        resources :reservations
      end
      resources :sessions, only: [:create]
      resources :registrations, only: [:create]
      delete :logout, to: "sessions#logout"
      get :logged_in, to: "sessions#logged_in"
    end
  end
end
