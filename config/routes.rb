Rails.application.routes.draw do
  get 'document/index'
  get 'document/show'
  get 'document/new'
  get 'document/edit'
  get 'document/create'
  get 'document/update'
  get 'document/destroy'
  get 'data_package/index'
  get 'data_package/show'
  get 'data_package/new'
  get 'data_package/create'
  get 'data_package/update'
  get 'data_package/destroy'
  get 'user/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
