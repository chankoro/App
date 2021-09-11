Rails.application.routes.draw do
  resources :users, only: %i[new create show]

  get "login", to: "user_sessions#new"
  post "login", to: "user_sessions#create"
  delete "logout", to: "user_sessions#destroy"
  root "users#new"
end
