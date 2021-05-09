Rails.application.routes.draw do
  get 'sessions/new'
  root 'products#index'

  resources :products
  get 'dashboard' => 'products#dashboard'
  get 'new_error_product' => 'products#new_error'
  post 'new_error_product' => 'products#new_error'

  resources :users
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
