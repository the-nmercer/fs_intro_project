Rails.application.routes.draw do
  get "breeds/index"
  get "home/index"
  root "home#index"
  resources :dogs, only: [:index, :show]
  get "about", to: "about#index"

  get "breeds", to: "breeds#index"
  get "breeds/:breed_id", to: "breeds#show", as: :breed
end
