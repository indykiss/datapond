
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
    # need to build a feature for seeing all the documents for a particular data package
    # or if i'm not seeing a particular data package, show all data packages
    resources :documents, only: [:new, :show, :index]
  end 

  resources :documents
  resources :favorites

  post '/sessions/create', to: 'sessions#create'

  get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/github/callback', to: 'sessions#create'
  
end
