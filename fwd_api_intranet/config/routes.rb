Rails.application.routes.draw do

  namespace :api do
    resources :users
    resources :internal_communications
    resources :private
    resources :articles
    resources :type_users
    # resources :sessions, only: [:create, :destroy] #añadir edit mas adelante
    # resources :registrations, only: [:create]
  end

  namespace :auth do

  end

   devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup'
    },
    controllers: {
      sessions: 'auth/sessions',
      registrations: 'auth/registrations'
    }
end
