
Rails.application.routes.draw do
 
  root 'sessions#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  delete 'sessions/signout', to: 'sessions#destroy'

  resources :users

  resources :data_packages do 
    resources :documents, only: [:new, :show]
  end 

  resources :documents
  resources :favorites

  post '/sessions/create', to: 'sessions#create'

  get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/github/callback', to: 'sessions#create'
  
  delete '/signout', to: 'sessions#destroy'

end
