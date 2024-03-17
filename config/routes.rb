Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "main#index"
  resources :users
  resources :queries
  resources :registrations

  get '/search_settings', to: 'queries#search_settings'
  # мб потом поменять
  get '/db_settings', to: 'queries#db_settings'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete "logout", to: "sessions#destroy"
  get '/sign_up', to: 'registrations#new'
end
