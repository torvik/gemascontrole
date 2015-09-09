Rails.application.routes.draw do
  resources :sales

  resources :products

  resources :customers

  resources :companies

  devise_for :users

  #devise_for :users, :controllers => { :registrations => "registrations" }
  root 'home#index'

  get 'home/sobre'
  get 'home/contato'
  get 'home/dashboard'

  #get "customers/word" => 'customers#word', :as => :word


end
