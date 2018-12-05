Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :user

  resources :employees_profile
  resources :clients_profiles
  resources :companies_profiles

  resources :plannings do
    resources :bookings
  end
end
