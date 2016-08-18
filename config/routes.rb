Rails.application.routes.draw do
  #routes for facebook-login
  devise_for :users,
    controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :offers do
    resources :availabilities
    resources :meetings
  end
end
