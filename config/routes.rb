Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show, :edit, :update, :destroy]

  root 'home#top'
  get 'home/about'
  get 'ranking', to: 'games#ranking'

  resources :categories, only: [:index, :new, :edit, :create, :update]
  resources :games do
  	resource :comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  resources :notifications, only: [:index]
end
