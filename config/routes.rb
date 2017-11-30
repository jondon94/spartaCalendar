Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookings, :rooms
  root to: 'bookings#index'

  get '/month', to: 'bookings#month'
  get '/week', to: 'bookings#week'
  post '/month', to: 'bookings#create'
  post '/week', to: 'bookings#create'

end
