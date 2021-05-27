Rails.application.routes.draw do
  root 'products#index'
  
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'

  get 'carts/show'
  get 'cart/show'
 
  get 'sessions/new'
  
  resources :products
  get 'dashboard' => 'products#dashboard'
  get 'new_error_product' => 'products#new_error'
  post 'new_error_product' => 'products#new_error'

  resources :users
  get '/signup', to: 'users#new'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :carts
  
  resources :cart_items do 
    patch :add_quantity, on: :member
    patch :reduce_quantity, on: :member
  end

  resources :account_activations, only: :edit

  resources :password_resets, only: %i[new create edit update]
end
