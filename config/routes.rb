Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "todos", to: "todos#index"
  # post "todos", to: "todos#create"
  # get "todos/:id", to: "todos#show"

  resources :todos

  # get "users", to: "users#show"
  # post "users", to: "users#create"
  resources :users
  post "users/login", action: :login, controller: "users"
end
