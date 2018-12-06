Rails.application.routes.draw do
  get 'prestations/new'
  get 'prestations/edit'
  root to: 'pages#home'

  devise_for :users
  resources :bookings, only: [:index, :show]
  resources :prestations, only: [:new, :edit, :update]
  resources :companies, only: [:index, :show]
  resources :jobs, only: [:index, :show]
end
