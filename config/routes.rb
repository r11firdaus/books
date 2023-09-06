Rails.application.routes.draw do
  # devise_for :users
  resources :books
  resources :authors
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "books#index"
  devise_for :users, :controllers => {
    registrations: 'registrations'
  }
end
