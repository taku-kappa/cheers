Rails.application.routes.draw do

  # get 'maps/show'
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }

  namespace :admin do
    root 'dashboards#index'
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
    resources :posts, only: [:index, :destroy]
    resources :post_comments, only: [:index, :destroy]
  end

  devise_for :users

  root to: "homes#top"

  get '/homes/about' => 'homes#about', as: 'about'

  resources :users, only: [:show, :edit, :update, :destroy] do
    resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
  end


  resources :posts, only: [:new, :show, :edit, :index, :create, :update, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorite, only: [:create, :destroy]
    collection do
      get 'search'
    end
  end


  Rails.application.routes.draw do
  namespace :admin do
    get 'posts/index'
  end
    resource :map, only: [:show]
    resource :posts, only: [:index]
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
