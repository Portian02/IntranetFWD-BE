Rails.application.routes.draw do

  get 'private/test'

  devise_for :users,
     path: '',
     path_names: {
       sign_in: 'login',
       sign_out: 'logout',
       registration: 'signup'
     },
     controllers: {
       sessions: 'users/sessions',
       registrations: 'users/registrations'
     }


    namespace :api do
      resources :users
      resources :internal_communications
      resources :articles
      resources :sessions, only: [:create, :destroy]
      resources :registrations, only: [:create]

    end


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
