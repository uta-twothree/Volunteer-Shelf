Rails.application.routes.draw do
  devise_for :users
  root to: "albums#index"
  resources :users, only: :show
  resources :albums, only: [:index]
end
