Rails.application.routes.draw do
  root to: 'dashboard#index'
  get '/latest', to: 'latest#index'
  get '/photos/new', to: 'photos#new'
end

