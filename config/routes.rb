
Rails.application.routes.draw do
 
  root 'sessions#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'


  resources :users

  resources :documents, only: [:new, :show, :create]

  resources :data_packages do 
    resources :documents do 
    end 
  end 

  post "/sessions/create", to: "sessions#create"
  get '/auth/facebook/callback' => 'sessions#create_from_omniauth'
  
 

  delete "/signout", to: "sessions#destroy"



end
