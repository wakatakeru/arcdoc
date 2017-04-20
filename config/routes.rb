Rails.application.routes.draw do
  root 'login#new'
  get 'root/index'
  resource  :login, only: %i{show create destroy}
  resources :user
  resources :document
  resources :tag
end
