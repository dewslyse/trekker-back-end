Rails.application.routes.draw do
  # devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  # Defines the root path route ("/")
  # root "articles#index"
  
  namespace :api do
    namespace :v1 do
      resources :destinations
      resources :reservations
      post '/login', to: 'sessions#login'
      post '/register', to: 'sessions#register'
    end
  end
end
