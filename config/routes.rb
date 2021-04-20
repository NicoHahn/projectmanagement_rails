Rails.application.routes.draw do

  root :to => 'sessions#create'

  resources :companies do
    resources :projects do
      resources :tasks
    end
  end

  patch 'tasks/:id/move', to: 'tasks#move'

  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  get 'companies', to: 'projects#index'

end
