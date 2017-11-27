Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookings, :rooms
  root to: 'rooms#index'

  get '/home', to: 'bookings#home'
end
