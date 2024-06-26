Rails.application.routes.draw do

  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  resources :game_posts, only: [:new, :index, :show, :edit, :create, :update, :destroy]
  resources :comments, only: [:new, :edit, :create, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end