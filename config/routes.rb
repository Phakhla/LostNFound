# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  get 'changelog', to: 'home#changelog'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  namespace :users do
    resources :settings, only: [] do
      collection do
        get 'password/edit', to: 'settings#edit_password'
        put 'password'
      end
    end
  end

  resources :posts, only: %i[new show edit create update destroy] do
    resources :comments, only: %i[create]

    resources :posters, only: %i[new] do
      collection do
        get :show
      end
    end

    collection do
      get :autocomplete
      get :lost
      get :found
      get :category_selects

      post :search
    end
  end

  resources :places do
    collection do
      get :search
    end
  end

  resources :notifications, only: %i[index]
end
