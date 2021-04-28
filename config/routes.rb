# frozen_string_literal: true

Rails.application.routes.draw do
  get 'events/index'
  get 'events/show'
  get 'events/new'
  get 'events/create'
  get 'events/edit'
  get 'events/update'
  get 'events/destroy'
  devise_for :users
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
