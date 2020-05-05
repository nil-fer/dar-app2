# frozen_string_literal: true

Rails.application.routes.draw do
  root 'pages#home_page'

  get 'pages/home_page'
  get 'users/outlet_list'
  devise_for :users
  resource :batches, only: %i[update create]
  resources :companies
  devise_for :outlets, path: 'auth', path_names: { sign_in: 'sign_in', sign_out: 'sign_out' }
  # devise_scope :outlet do
  #   get 'sign_in', to: 'devise/sessions#new'
  #   get 'sign_out', to: 'devise/sessions#destroy'
  # end

  resources :outlets do
    resources :products
  end

end
