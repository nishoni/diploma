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
  get 'get_user_info', to: "sessions#get_user_info"

  get '/sign_up', to: 'registrations#new'
  post '/registrations', to: 'registrations#create'

  get 'get_queries', to: 'history#queries'
  get 'history_export', to: 'history#export'

  get 'setting_fields', to: 'search_settings#setting_fields'
  post 'save_settings', to: 'search_settings#save_settings'

  get 'main_statistics_db', to: 'database_settings#main_statistics_db'
  get 'side_statistics_db', to: 'database_settings#side_statistics_db'
  post 'load_db', to: 'database_settings#load_db'
  get 'db_versions', to: 'database_settings#db_versions'
end
