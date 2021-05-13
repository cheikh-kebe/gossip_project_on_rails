Rails.application.routes.draw do

 
  resources :city
  resources :gossip do 
    resources :comment
  end
  resources :gossips do
    resources :likes
  end
  resources :welcome
  resources :user
  resources :index
  resources :sessions, only:[:new, :create, :destroy, :index]


  get '/', to: 'index#index'
  get 'contact', to: 'contact#show'
  get 'team', to: 'team#show'

end