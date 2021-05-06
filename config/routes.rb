Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :books, only: [:create, :index, :show, :destroy, :edit, :update] do
    resources :book_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  root to: 'homes#top'
  get "home/about" => "homes#about" , as: "about"

  resources :users, only: [:show, :edit, :update, :index, :destroy] do
    get "follower" => "relationships#follower" , as: "follower"
    get "followed" => "relationships#followed" , as: "followed"
  end


  post "follow/:id" => "relationships#follow" , as: "follow"
  post "unfollow/:id" => "relationships#unfollow" , as: "unfollow"


end
