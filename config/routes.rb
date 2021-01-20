Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  get '/logout' => 'sessions#destroy'
  #delete '/logout' => 'sessions#destroy'
  #not sure why 'delete' method/request doesnt work, but 'get' does?
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'
  #get '/auth/:provider/callback' => 'sessions#omniauth'
#if I end up hosting this to heroku, ill need to go to :
# https://console.cloud.google.com/apis/credentials/oauthclient/322165384303-1k9tckicc9918m1kgqeit1bdg9vln021.apps.googleusercontent.com?project=rails-project-302302&supportedpurview=project
# and add another authorized uri
  resources :reactions
  resources :dreams do
    resources :reactions, only: [:new, :index]
  end
  resources :themes
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
