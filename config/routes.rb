Rails.application.routes.draw do
  devise_for :users
  get 'menus/index'
  root to: "menus#index"
  resources :menus do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end

  resources :users, only: :show
end
