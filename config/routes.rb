Rails.application.routes.draw do

  resources :city
  resources :gossip do 
    resources :comment
  end
  resources :welcome
  resources :user
  resources :index


  get '/', to: 'index#index'
  # get 'user/:id', to: 'user#show'


  # get 'welcome', to: 'welcome#show'
  # get '/welcome/:id', to: 'welcome#show'
  
  get 'contact', to: 'contact#show'
  get 'team', to: 'team#show'

end