# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :posts, only: %i[new show edit create update destroy] do
    resources :comments, only: %i[create]

    collection do
      get :autocomplete
      get :search
      get :lost
      get :found
      get :category_selects
    end
  end

  resources :places do
    collection do
      get :search
    end
  end

  resources :notifications, only: %i[index]
end
