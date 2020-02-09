Rails.application.routes.draw do
  root 'home#top'
  get 'about', to: 'home#about'
  get 'ranking', to: 'games#ranking'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy]

  resources :categories, only: [:index, :new, :edit, :create, :update]

  resources :games do
  	resource :comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end

  resources :notifications, only: [:index]
end
