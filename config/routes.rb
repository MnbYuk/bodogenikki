Rails.application.routes.draw do

   devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end
  
  scope module: :public do
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"
  resources :game_posts, only: [:new, :index, :show, :edit, :create, :update, :destroy] do
    resources :comments, only: [:new, :edit, :create, :update, :destroy]
  end
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  get 'search', to: 'searches#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  end
  end