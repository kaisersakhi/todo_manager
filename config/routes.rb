Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # get "todos", to: "todos#index"
  # post "todos", to: "todos#create"
  # get "todos/:id", to: "todos#show"

  get '/', to: 'main#index'

  resources :todos

  # get "users", to: "users#show"
  # post "users", to: "users#create"
  resources :users
  # post "users/login", action: :login, controller: "users"

  get '/sign-in', action: :new, controller: 'sessions', as: :new_sign_in
  post '/sign-in', action: :create, controller: 'sessions', as: :sign_in
end
