Rails.application.routes.draw do
  root to: 'pages#banner'
  get '/home', to: 'pages#home'

  devise_for :user
  resources :booking, only: [:index, :show]
  resources :prestation, only: :update
end
