Rails.application.routes.draw do

# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :users
  root 'records#index'
  
  resources :records do
  	resources :comments
  end

  get 'search_record', to: 'records#search'

end
