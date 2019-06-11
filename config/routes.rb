
Rails.application.routes.draw do
 
  resources :categories

  root 'sessions#home'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'

  delete '/signout', to: 'sessions#destroy'

  resources :users

  get '/data_packages/top_five', to: 'data_packages#top_five'
  get '/data_packages/most_favorited', to: 'data_packages#most_favorited'

  resources :data_packages do 
    # If I wanted to do a nested route for the top_five under data packages
    # I can tell the route to say "add top_five" to datapackages
    # it's ok to have a long list of 
    # get '/top_five', on: :collection     
    resources :documents, only: [:new, :show, :index]
  end 

  post '/data_packages/new', to: 'data_packages#create'


  resources :documents
  resources :favorites
  resources :categories

  post '/sessions/create', to: 'sessions#create'

  get '/auth/facebook/callback', to: 'sessions#create'
  get '/auth/github/callback', to: 'sessions#create'
  
end
