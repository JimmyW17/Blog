Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'home#index'
  resources :users
  resources :comments
  resources :posts do
    resources :comments
  end
  resources :sessions
  resources :posts

  get '/signup' => 'users#new'
  get '/logout', to: 'sessions#destroy'
  get '/login', to: 'sessions#new'
  root 'home#index'
end
