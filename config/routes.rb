Rails.application.routes.draw do
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy' , :as => :logout
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  get 'users/new'
  root :to => 'users#index'
  resources :users
 
end
