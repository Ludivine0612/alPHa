Rails.application.routes.draw do
  root to: 'pages#banner'
  get '/home', to: 'pages#home'
  get "/companies", to: "companies#show"

  devise_for :users
  resources :bookings, only: [:index, :show]
  resources :prestations, only: [:new, :edit, :update]
  resources :companies, only: [:index, :show]
  resources :jobs, only: [:index, :show]
end
