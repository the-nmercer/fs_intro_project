Rails.application.routes.draw do
  root "dogs#index"
  resources :dogs, only: [:index]
  get "about", to: "about#index"
end
