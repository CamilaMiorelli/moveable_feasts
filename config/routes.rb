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
    resource :chatroom, only: :show  do
    resources :messages, only: :create
  end
  end
end
