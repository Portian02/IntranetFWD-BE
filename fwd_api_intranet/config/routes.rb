Rails.application.routes.draw do

  namespace :api do
    resources :users
    resources :internal_communications
    resources :private
    resources :calendar_events
    resources :type_users
    resources :announcements
    resources :admonitions 
    resources :justifications
    resources :internal_communications_users
    resources :documents_storages

    # resources :sessions, only: [:create, :destroy] #añadir edit mas adelante
    # resources :registrations, only: [:create]

  end

  namespace :auth do
    devise_for :users, controllers: {
      registrations: 'auth/registrations'
    }
  end



   devise_for :users,
    path: '',
    path_names: {
      sign_in: 'login',
      sign_out: 'logout',
      registration: 'signup',

    },

    controllers: {
      sessions: 'auth/sessions',
      registrations: 'auth/registrations',

    }



end
