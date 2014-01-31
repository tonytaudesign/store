Bakedfresh::Application.routes.draw do


  root to: 'store#index', as: 'store'
  get "errors/routing"

  resources :users
  
  
  resources :orders
  resources :customers
  resources :carts
  resources :charges

  resources :products do
    get :who_bought, on: :member
  end 



  resources :line_items



  resources :sessions, only: [:new, :create, :destroy]

  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  get 'sessions/signout'
  match '/cart', to: 'carts#index', via: 'get'
  
  match '/order', to: 'charges#new', via: 'get'

#Last route in routes.rb
  match '*a', :to => 'errors#routing', via: [:get, :post]
end
