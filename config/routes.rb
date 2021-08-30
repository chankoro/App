Rails.application.routes.draw do
<<<<<<< HEAD
  get 'login' => 'user_sessions#new', :as => :login
  post 'login' => "user_sessions#create"
  post 'logout' => 'user_sessions#destroy' , :as => :logout
  get 'user_sessions/create'
  get 'user_sessions/destroy'
  get 'users/new'
  root :to => 'users#index'
  resources :users
 
=======
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 root 'pages#index'
>>>>>>> origin/master
end
