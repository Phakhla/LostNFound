# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users, controllers: { registrations: 'users/registrations' }

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :posts do
    resources :comments
    collection do
      get :search
      get :lost
      get :found
    end
  end
end
