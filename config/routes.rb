# frozen_string_literal: true

Rails.application.routes.draw do

  resources :cart_items, only: %i[create update destroy]
  resources :carts, only: %i[index create]


  concern :paginatable do
    get '(page/:page)', action: :index, on: :collection, as: ''
  end
  resources :products, only: %i[index show], concerns: :paginatable

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    omniauth_callbacks: 'omni_auth'
  }
  devise_scope :user do
    get 'sign_in', to: 'users/sessions#new'
    get 'sign_up', to: 'users/registrations#new'
    get 'forgot_password', to: 'users/passwords#new'
    get 'reset_password', to: 'users/passwords#edit'
  end

  root to: 'products#index'
end
