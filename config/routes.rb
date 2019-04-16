Rails.application.routes.draw do
  resources :characters
  resources :user_meetups
  resources :meetups
  resources :campaigns
  resources :users
  get "/login", to: "application#login", as: "login"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
