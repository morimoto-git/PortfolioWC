Rails.application.routes.draw do
  root 'home#top'
  get 'about', to: 'home#about'
  get 'ranking', to: 'games#ranking'

  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy] do
    get 'following', to: 'relationships#following', as: 'following'
    get 'follower', to: 'relationships#follower', as: 'follower'
  end

  post 'follow/:id', to: 'relationships#follow', as: 'follow'
  post 'unfollow/:id', to: 'relationships#unfollow', as: 'unfollow'

  resources :categories, only: [:index, :new, :edit, :create, :update]

  resources :games do
  	resource :comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end

  resources :notifications, only: [:index]
end
