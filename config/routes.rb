Xdpogo::Application.routes.draw do
  root to: 'welcome#index'
  resources :users, :only => [:show]
  resources :events, :only => [:show]
  # get '/auth/:provider/callback', to: 'sessions#create', as: 'callback'
  # get '/auth/failure', to: 'sessions#error', as: 'failure'
  # delete '/signout', to: 'sessions#destroy', as: 'signout'
end
