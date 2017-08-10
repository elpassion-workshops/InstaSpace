Rails.application.routes.draw do
  root to: 'dashboard#index'
  get '/latest', to: 'latest#index'
end

