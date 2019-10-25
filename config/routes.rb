Rails.application.routes.draw do
  devise_for :users
  root "reviews#index"

  resources :reviews do
    collection do
      get :dout
    end
    resources :likes, only: [:create, :destroy]
    resource :comments, only: [:create, :destroy, :edit, :update]
  end
  resources :users, only: [:index, :edit, :update, :show] 
end
