Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  get '/logout' => 'sessions#destroy'
  #delete '/logout' => 'sessions#destroy'
  #not sure why 'delete' method/request doesnt work, but 'get' does?

  #dont need post '/signup' bc we already have a route for it in resources :users
  resources :reactions
  resources :dreams do
    resources :reactions, only: [:new, :index]
  end
  resources :themes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
