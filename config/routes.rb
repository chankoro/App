Rails.application.routes.draw do
 get 'houseworks/new'
 get 'sessions/new'
 
  root "pages#index"

  
  get 'login', to: "user_sessions#new"
  post 'login', to: "user_sessions#create"
  delete '/logout',  to: "user_sessions#destroy", as: :logout
  get "edit", to: "user_sessions#edit"
  get "show", to: "users#show"
  
  get 'houseworks/index'
  post '/houseworks', to: 'houseworks#create'
  delete '/houseworks', to: 'houseworks#destroy'

  resources :users, only: %i[new create show destroy]
  #家事モデルのresource
  resources :houseworks
end
