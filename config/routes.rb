Rails.application.routes.draw do
 
  root "pages#index"
  resource
  s :users, only: %i[new create show]
  
  get 　'/login',  to: 'user_sessions#new'
  post 'login', to: "user_sessions#create"
  delete '/logout',  to: "user_sessions#destroy", as: :logout
  get "edit", to: "user_sessions#edit"
  get "show", to: "users#show"
  
    root 'houseworks#index'
    get 'houseworks', to: "houseworks#index"
    post 'houseworks', to: "houseworks#store"
    get 'houseworks/:id', to: "houseworks#show"
    put 'houseworks/:id', to: "houseworks#update"
    delete 'houseworks/:id', to: "houseworks#destroy"
    
  resources :users, only: %i[new create show]
  #家事モデルのresource
  resources :houseworks
end
