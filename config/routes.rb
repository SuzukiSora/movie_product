Rails.application.routes.draw do

  
  root to: 'toppages#index' do
    member do 
      get :followings
      get :followers

      get :likes
    end
  end

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update] do
    member do 
      get :followings
      get :followers

      get :likes
    end
  end
  
  resources :posts, only: [:new, :show, :new, :create, :edit, :create] do
    resources :likes, only: [:create, :destroy]
  end
  resources :relationships, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]

  
end
