Rails.application.routes.draw do
  root "main#index"
  resources :queries

  get '/search_settings', to: 'queries#search_settings'
  # мб потом поменять
  get '/db_settings', to: 'queries#db_settings'
  post 'search', to: 'main#search'
  get 'export', to: 'main#export'

  get '/sign_in', to: 'sessions#new'
  post '/sign_in', to: 'sessions#create'
  delete "logout", to: "sessions#destroy"

  get '/sign_up', to: 'registrations#new'
  get 'get_queries', to: 'history#queries'
  get 'history_export', to: 'history#export'
end
