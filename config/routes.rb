Rails.application.routes.draw do
  devise_for :users
  root "tweets#index"
  resources :tweets
  post "follows/follow/:id" => "follows#follow"
  post "follows/unfollow/:id" => "follows#unfollow"
  resources :followers
  get "users/profile/:id" => "users#profile"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
