# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'

  devise_for :users

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :posts do
    resources :comments
    collection do
      get :search
    end
  end
end
