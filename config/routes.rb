Rails.application.routes.draw do
<<<<<<< HEAD
=======

>>>>>>> 51d5524f96752b7584b814da9fc86a818f3b0463
  #routes for facebook-login
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :offers do
    resources :availabilities
    resources :meetings
  end
  namespace :dashboard do
<<<<<<< HEAD
    resources :offers, only: [:index]
    resources :meetings, only: [] do
      member do
=======
    resources :messtousers
    resources :offers, only: [:index]
    resources :meetings, only: [] do
      member do

>>>>>>> 51d5524f96752b7584b814da9fc86a818f3b0463
        patch :confirm
        patch :decline
      end
    end
  end
end
