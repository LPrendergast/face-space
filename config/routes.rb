Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except:[:destroy, :new]
  resources :pages
  resources :posts
  resources :messages, only: [:create,:index]

  
  post '/', to: 'sessions#create', as: "sessions"
  delete '/', to: 'sessions#destroy', as: "logout"

  get '/signup', to: 'users#new', as: "sign_up"

  post '/friendships', to: 'friendships#create', as: "add_friend"

end
