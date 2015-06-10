Rails.application.routes.draw do
  resources :products

  resources :customers

  resources :companies

  devise_for :users
  root 'home#index'


end
