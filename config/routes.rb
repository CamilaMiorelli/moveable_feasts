Rails.application.routes.draw do
  get 'feasts/cancel'
  get 'feasts/show'
  get 'feasts/home'
  get 'feasts/index'
  get 'feasts/create'
  devise_for :users
  root to: 'feasts#home'
  resources :feasts do
    resources :reservations, only: [ :new, :create, :show, :update]
    resources :chatroom, only: [ :show ]
  end
  # resources :reviews
  # resources :messages
end
