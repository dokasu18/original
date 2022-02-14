Rails.application.routes.draw do
  devise_for :users
  get 'menus/index'
  root to: "menus#index"
  resources :menus, only: [:index, :new, :create]
end
