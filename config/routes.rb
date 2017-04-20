Rails.application.routes.draw do
  get 'root/index'
  root to: 'login#new'
  resource  :login, only: %i{show create destroy}
  resources :user
  resources :document
  resources :tag
end
