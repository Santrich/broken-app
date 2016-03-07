FacebookLite::Application.routes.draw do
  resources :users, only: [:new, :create, :show, :index, :edit] do
    resources :posts, only: [:index, :create, :edit, :update]
  end

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :posts,               only: [:edit, :update, :destroy]
  resources :users,               only: [:edit, :update, :destroy]
  resources :relationships,       only: [:create, :destroy]


  get '/login', to: 'sessions#new', as: :login
  get '/session', to: redirect('/login')
  delete '/logout', to: 'sessions#destroy', as: :logout
  resource :session, only: [:new, :create, :destroy]

  root 'welcome#index'
end
