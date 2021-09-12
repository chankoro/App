Rails.application.routes.draw do
 
  root "users#new"
  root 'houseworks#index'
  
  resources :users, only: %i[new create show]
  
  #家事モデルのresource
  resources :houseworks

  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  get "edit", to: "user_sessions#edit"
  get "show", to: "user_sessions#show"
  
  delete "logout", to: "user_sessions#destroy"
  
end
