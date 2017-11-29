Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookings, :rooms
  root to: 'bookings#index'

  get '/next', to: 'bookings#next'

end
