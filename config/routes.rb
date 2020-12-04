Rails.application.routes.draw do
 devise_for :users
 root "homes#home"
 get "/home/about" => "homes#about"
 post 'follow/:id' => 'relationships#follow', as: 'follow' 
 post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' 
 resources :books
 resources :users, only: [:index, :show, :edit, :update]
end
