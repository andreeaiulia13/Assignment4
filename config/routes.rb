Rails.application.routes.draw do
  get 'carts/show'
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'cart/show'
  root 'products#index'

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

  get 'carts/:id' => "carts#show", as: "cart"
  delete 'carts/:id' => "carts#destroy"

  post 'add_items/:id/add' => "add_items#add_quantity", as: "add_item_add"
  post 'add_items/:id/reduce' => "add_items#reduce_quantity", as: "add_item_reduce"
  post 'add_items' => "add_items#create"
  get 'add_items/:id' => "add_items#show", as: "add_item"
  delete 'add_items/:id' => "add_items#destroy"

end
