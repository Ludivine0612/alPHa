Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users
  resources :bookings, only: [:index, :show]
  resources :prestations, only: :update
  resources :companies, only: [:index, :show]
end
