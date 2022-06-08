# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  root 'home#index'

  devise_for :users

  resources :posts do
    collection do
      get :search
    end
  end
end
