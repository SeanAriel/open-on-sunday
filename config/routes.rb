Rails.application.routes.draw do
  get 'forumoffers/create'

  #routes for facebook-login
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :offers do
    resources :availabilities
    resources :meetings
    resources :forumoffers
  end

  resources :users, only: [:show]

  namespace :dashboard do
    resources :messtousers
    resources :offers, only: [:index]
    resources :meetings, only: [] do
      member do
        patch :confirm
        patch :decline
      end
    end
  end
end
