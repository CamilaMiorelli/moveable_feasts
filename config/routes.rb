Rails.application.routes.draw do
  devise_for :users
  root to: 'feasts#home'
  resources :feasts do
    resources :reservations, only: [ :new, :create, :show, :update] do
      member do
        put :accept
        put :decline
      end
    end
    resources :chatroom, only: [ :show ]

  end
  # resources :reviews
  # resources :messages
end
