Rails.application.routes.draw do
  devise_for :users
  root "reviews#index"
  resources :reviews, only: [:new, :create, :edit, :update, :show, :destroy] do
    resource :comments, only: [:create, :destroy, :edit, :update]
  end
  resources :users, only: [:edit, :update, :show]
end
