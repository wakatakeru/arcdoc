Rails.application.routes.draw do
  get 'root/index'
  root to: 'root#index'

  resources :user
  resources :document
  resources :tag
end
