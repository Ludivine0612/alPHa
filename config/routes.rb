Rails.application.routes.draw do
  get 'plannings/show'
  get 'plannings/edit'
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/new'
  get 'bookings/edit'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :services
end
