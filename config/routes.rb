Rails.application.routes.draw do

  root :to => 'sessions#create'

  resources :companies do
    resources :projects do
      resources :tasks
    end
  end

  resources :activities

  post 'companies/:id', to: 'companies#add_user'

  patch 'tasks/:id/move', to: 'tasks#move'

  post 'users/accept_invitation/:invitation_id', to: 'users#accept_invitaion'
  post 'users/decline_invitation/:invitation_id', to: 'users#decline_invitaion'

  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  get 'companies', to: 'projects#index'

end
