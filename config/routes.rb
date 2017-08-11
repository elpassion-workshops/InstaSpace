Rails.application.routes.draw do
  root to: 'dashboard#index'
  devise_for :users
  get '/latest' => 'pictures#latest', as: 'latest'
  get '/pictures' => 'pictures#latest'
  resources :pictures
end

