Rails.application.routes.draw do

  root :to => 'sessions#create'

  resources :companies do
    resources :projects
  end

  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'
  get 'companies', to: 'projects#index'

end
