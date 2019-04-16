Rails.application.routes.draw do
 
  resources :users

  resources :data_packages do 
      resources :documents do 
      end 
    end 

  resources :data_providers 

  root 'users#welcome'
  
end
