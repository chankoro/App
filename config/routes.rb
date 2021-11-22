Rails.application.routes.draw do
 
  root "pages#index"
  
  get 'sessions/new'
  get 'login', to: "user_sessions#new"
  post 'login', to: "user_sessions#create"
  delete '/logout',  to: "user_sessions#destroy", as: :logout
  get "show", to: "users#show"
  
  # #家族idを作る前のユーザー情報
  # resources :users, only: %i[new create show destroy]
  
  #家族idを作ってからのユーザーおよび家族情報
  resources :families, only: %i[show edit] do
  resources :users, only: %i[new create show destroy edit update], module: "families"
  #家事モデル
  resources :works, module: "families" do
    collection do
      get :weekly
    end
    member do
     post :done
    end
  end
  #掲示板モデル
  resources :familyboards, except: %i[edit update], module: "families"
  end
  
  resources :users, except: [:index] do
    collection do
      get :invites
    end
  end
  
  #招待機能モデル
  resources :invites
  
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end

end

