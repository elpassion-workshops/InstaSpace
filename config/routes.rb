Rails.application.routes.draw do
  root to: 'dashboard#index'
  devise_for :users
  resources :pictures
  get '/latest' => 'pictures#latest'
end

