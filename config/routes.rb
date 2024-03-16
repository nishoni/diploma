Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "queries#search"
  resources :users
  resources :queries

  get '/search_settings', to: 'queries#search_settings'
  # мб потом поменять
  get '/db_settings', to: 'queries#db_settings'

  get '/sign_in', to: 'users#sign_in'
  post '/signing_in', to: 'users#signing_in'
  get '/sign_up', to: 'users#sign_up'
end
