Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:new, :create]
  resources :tasks, only: [:index, :new, :create]
  root "tasks#index"
end
