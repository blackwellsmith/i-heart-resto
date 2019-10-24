Rails.application.routes.draw do

  resources :restaurants
  resources :reviews
  root 'sessions#home' 
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#fbcreate'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :static

  resources :restaurants do
    resources :reviews, only: [ :new, :show ]
  end

  resources :reviews do 
    resources :restaurant, only: [:show]
  end
end
