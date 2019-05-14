
Rails.application.routes.draw do
 
  resources :categories

  root 'sessions#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'

  resources :users

  resources :data_packages do 
    resources :documents, only: [:new, :show, :index]
  end 

  resources :documents
  resources :favorites
  resources :categories

  get '/most_favorited', to: 'favorites#most_favorited'
  post '/sessions/create', to: 'sessions#create'

  get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/github/callback', to: 'sessions#create'
  
end
