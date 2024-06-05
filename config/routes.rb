Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/edit'
  get 'posts/new'
  get 'posts/index'
  get 'posts/show'
  get 'posts/edit'
  get 'users/mypage'
  get 'users/edit'
  get 'users/show'
  devise_for :users
  root to: "homes#top"
  get "home/about" => "homes#about", as: "about"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
