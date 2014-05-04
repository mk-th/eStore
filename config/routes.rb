Rails.application.routes.draw do

  root 'accounts#index'

  get "login", to: 'sessions#new', as: 'login'
  get "logout", to: 'sessions#destroy', as: 'logout'

  resources :users  
  resources :sessions, :except => [:index]  
  resources :journals, :only => [:new, :create]

  resources :accounts do
    resources :journals, :except => [:new, :create]
    collection { post :import }
    collection { get :download }
  end

end
