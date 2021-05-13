# frozen_string_literal: true

Rails.application.routes.draw do
  get 'contacts/new'
  devise_for :users
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  resources :posts
  resources :events
  resources :contacts, only: [:new, :create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
