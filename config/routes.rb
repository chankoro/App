Rails.application.routes.draw do
 
  root "pages#index"
  
  get 'sessions/new'
  get 'login', to: "user_sessions#new"
  post 'login', to: "user_sessions#create"
  delete '/logout',  to: "user_sessions#destroy", as: :logout
  get "edit", to: "user_sessions#edit"
  get "show", to: "users#show"
  
  get 'houseworks/new'
  get 'houseworks/index'
  post '/houseworks', to: 'houseworks#create'
  delete '/houseworks', to: 'houseworks#destroy'
  get "show/houseworks", to: "houseworks#show"
  
  get 'familyboards/new'
  get 'familyboards/index'
  post '/familyboards', to: 'familyboards#create'
  delete '/familyboards', to: 'familyboards#destroy'
  
  
  resources :users, only: %i[new create show destroy]
  #家事モデルのresource
  resources :houseworks
  resources :familyboards
end
