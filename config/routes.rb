Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users, :only => [:show] do
    resources :reviews, only: [:new, :create]
  end
  root to: 'feasts#home'
  resources :feasts do
    resources :reservations, only: [ :new, :create, :show, :update] do
      resources :payments, only: :new
      member do
        put :accept
        put :decline
      end
    end
    resource :chatrooms, only: :show  do
    resources :messages, only: :create
  end
  end
  get '/bookings' => 'reservations#bookings', as: "bookings"
  get '/incoming_bookings' => 'reservations#incoming_bookings', as: "incoming_bookings"
  resources :chatrooms, only: :index
end
