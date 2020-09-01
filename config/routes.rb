Rails.application.routes.draw do
  get 'reservations/create'
  get 'reservations/new'
  get 'reservations/show'
  get 'reservations/update'
  devise_for :users
  root to: 'feasts#home'
  resources :feasts do
    resources :reservations, only: [ :new, :create, :show, :update]
    resources :chatroom, only: [ :show ]
  end
  # resources :reviews
  # resources :messages
end
