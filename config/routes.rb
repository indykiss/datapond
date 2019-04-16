
Rails.application.routes.draw do
 
  root 'users#welcome'

  resources :users

  resources :data_packages do 
      resources :documents do 
      end 
    end 

  resources :data_providers 

  get 'login' => 'users#new'

  
end
