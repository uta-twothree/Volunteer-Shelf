Rails.application.routes.draw do
  devise_for :users
  root to: "albums#index"
  resources :users, only: [:show, :edit, :update]
  resources :albums, only: [:index, :new, :create, :show, :edit, :update] do
    resources :memories
    resources :comments, only: :create
  end
end
