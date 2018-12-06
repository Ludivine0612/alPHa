Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :user
  resources :bookings, only: [:index, :show]
  resources :prestations, only: :update
end
