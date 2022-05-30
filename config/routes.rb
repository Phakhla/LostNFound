Rails.application.routes.draw do
  devise_for :users
  resources :founds
  resources :losts
  # get 'home/indezx'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
