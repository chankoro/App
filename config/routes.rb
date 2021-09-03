Rails.application.routes.draw do
 resources :users, only: %i[new create]
 
  #新規登録した際に Post"users/new"のエラーが出たため追記
  get "users/new", to: "users#new"
  post "users/new", to: "users#create"
  
  get 'login', to: 'user_sessions#new'
  post 'login',to: "user_sessions#create"
  delete 'logout',to: 'user_sessions#destroy'
  root 'users#new'
  

end
