# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home'

  get 'pages/home'
  devise_for :users, controllers: { registrations: 'registrations' }
  resource :batches, only: %i[update create]
  resources :companies

  resources :outlets do
    resources :products
  end

end
