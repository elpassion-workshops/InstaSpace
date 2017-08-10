Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboard#index'

  resources :users, only: [:show] do
    post 'follow', on: :member
    post 'unfollow', on: :member
  end
end

