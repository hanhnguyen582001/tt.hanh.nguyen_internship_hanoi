Rails.application.routes.draw do
  get "/home", to: "my_static_pages#home"
  get "/about", to: "my_static_pages#about"
  get "/help", to: "my_static_pages#help"
  get "/contact", to: "my_static_pages#contact"
  resources :users
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "my_static_pages#home"
end
