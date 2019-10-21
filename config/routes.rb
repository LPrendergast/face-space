Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, except:[:destroy]
  resources :pages
  resources :posts

  get '/login', to: 'sessions#new', as:"new_session"
  post '/login', to: 'sessions#create', as: "sessions"
  delete '/login', to: 'sessions#destroy'

end
