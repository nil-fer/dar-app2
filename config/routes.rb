# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "registrations" }
  resource :batches, only: [:update, :create]
  resources :products
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'pages/home'
  get 'users/profile'
  root 'pages#home'
end
