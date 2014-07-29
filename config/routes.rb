Rails.application.routes.draw do
  root to: 'visitors#index'
  devise_for :users
  resources :users
  resources :teams do
    get "delete"
  end
  resources :toto_forms
  resources :user_guesses
  resources :matches
end
