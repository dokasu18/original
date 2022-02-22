Rails.application.routes.draw do
  devise_for :users
  get 'menus/index'
  root to: "menus#index"
  resources :menus do
    resources :comments, only: :create
  end

  resources :users, only: :show
end
