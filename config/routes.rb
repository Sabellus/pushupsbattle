Rails.application.routes.draw do
  get 'parser/show'

  resources :trainings
  get 'signup', to: 'users#new'
  post 'login', to: 'sessions#create'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  resources :users
  get 'page/index'
  root 'page#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
