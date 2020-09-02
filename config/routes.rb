Rails.application.routes.draw do
  devise_for :users
  root to: 'feasts#home'
  resources :feasts do
<<<<<<< HEAD
    resources :reservations, only: [ :new, :create, :show, :update] do
      member do
        put :accept
        put :decline
      end
    end
    resources :chatroom, only: [ :show ]

=======
    resources :reservations, only: [ :new, :create, :show, :update]
    resource :chatroom, only: :show  do
    resources :messages, only: :create
  end
>>>>>>> master
  end
end
