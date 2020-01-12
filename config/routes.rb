Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]

  root 'home#top'
  get 'home/about'

  resources :categories, only: [:index, :new, :edit, :create, :update]
  resources :games
end
