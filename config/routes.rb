Rails.application.routes.draw do
 devise_for :users

 root "homes#home"
 resources :books
 resources :users, only: [:index, :show, :edit, :update]
 get "/home/about" => "homes#about"
 get 'users/:id/following' => 'users#following', as: 'following'
 get 'users/:id/followers' => 'users#followers', as: 'followers'
 post 'follow/:id' => 'relationships#follow', as: 'follow'
 post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow'

end
