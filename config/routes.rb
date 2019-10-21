Rails.application.routes.draw do
  devise_for :users
  root "reviews#index"
  # post   '/like/:review_id' => 'likes#like',   as: 'like'
  # delete '/like/:review_id' => 'likes#unlike', as: 'unlike'

  resources :reviews, only: [:new, :create, :edit, :update, :show, :destroy] do
    resources :likes, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy, :edit, :update]
  end
  resources :users, only: [:edit, :update, :show]
end
