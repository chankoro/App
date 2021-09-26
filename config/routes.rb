Rails.application.routes.draw do
 
  root "pages#index"
  
  get 'sessions/new'
  get 'login', to: "user_sessions#new"
  post 'login', to: "user_sessions#create"
  delete '/logout',  to: "user_sessions#destroy", as: :logout
  get "edit", to: "user_sessions#edit"
  get "show", to: "users#show"
  
  # #家族idを作る前のユーザー情報
  # resources :users, only: %i[new create show destroy]
  
  #家族idを作ってからのユーザーおよび家族情報
  resources :families, only: %i[show] do
  resources :users, only: %i[new create show destroy], module: "families"
end
  resources :users, only: %i[new create show destroy]
  #家事モデルのresource
  resources :houseworks
  resources :familyboards
end
