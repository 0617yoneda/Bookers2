Rails.application.routes.draw do
 devise_for :users
 root "homes#home"
 get "/home/about" => "homes#about"
 resources :books
 resources :users, only: [:index, :show, :edit, :update]
end
