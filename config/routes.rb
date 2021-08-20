Rails.application.routes.draw do
  post "/login", to: "auth#login"
  # get "/me", to: "users#me"

  post "/createUser", to: "auth#create"
  get "/profile", to: "users#show"

  patch "/userTrips", to: "users#update"

  resources :activities, only: [:index, :show]
  resources :locations, only: [:index, :show]
  resources :trips, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
