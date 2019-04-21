
Rails.application.routes.draw do
 
  root 'sessions#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  delete "sessions/signout", to: "sessions#destroy"

  resources :users

  resources :documents, only: [:new, :show, :create, :index]

  resources :data_packages do 
    resources :documents do 
    end 
  end 

  resources :favorites

  post "/sessions/create", to: "sessions#create"
  get '/auth/facebook' => 'sessions#create_from_omniauth'
  
  delete "/signout", to: "sessions#destroy"

end
