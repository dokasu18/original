Rails.application.routes.draw do
  get 'menus/index'
  root to: "menus#index"
end
