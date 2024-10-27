Rails.application.routes.draw do
  get "home/index"
  root "dogs#index"
  resources :dogs, only: [:index]
  get "about", to: "about#index"
end
