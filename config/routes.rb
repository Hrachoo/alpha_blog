Rails.application.routes.draw do
  root "pages#home"
  get "about", to: "pages#about"
  resources :articles

  # Users
  resources :users, except: [ :new ]
  get "signup", to: "users#new"
end
