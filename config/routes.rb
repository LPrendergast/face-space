Rails.application.routes.draw do
  get 'analytics/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post '/pages-search', to: 'pages#search', as: "page_search"
  post '/users-search', to: 'users#search', as: "user_search"
  resources :users, except: [:destroy, :new]
  resources :pages
  resources :posts, only: [:new, :create, :edit, :update, :destroy]
  resources :messages, only: [:create,:index]
  resources :friendships, only: [:destroy]
  resources :analytics, only: [:show]
  get '/auth/spotify/callback', to: 'users#spotify'

  post '/', to: 'sessions#create', as: "sessions"
  delete '/', to: 'sessions#destroy', as: "logout"
  get '/', to: 'users#new', as: "sign_up"

  get '/pages-search', to: 'pages#index'
  get '/users-search', to: 'pages#show'


  post '/friendships', to: 'friendships#create', as: "add_friend"

end
