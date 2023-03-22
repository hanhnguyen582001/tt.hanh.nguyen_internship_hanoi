Rails.application.routes.draw do
  get 'password_resets/new'
  get 'password_resets/edit'
  get '/home', to: 'my_static_pages#home'
  get '/about', to: 'my_static_pages#about'
  get '/help', to: 'my_static_pages#help'
  get '/contact', to: 'my_static_pages#contact'
  resources :users do
    member do
      get :followers, :following
    end
  end
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :account_activations, only: [:edit]
  resources :password_resets, only: %i[new create edit update]
  resources :microposts, only: %i[create destroy]
  resources :relationships, only: %i[create destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'my_static_pages#home'
end
