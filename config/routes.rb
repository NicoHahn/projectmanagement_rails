Rails.application.routes.draw do
  get 'tasks/create'
  get 'tasks/update'
  get 'tasks/delete'
  get 'tasks/show'
  get 'projects/create'
  get 'projects/update'
  get 'projects/delete'
  get 'projects/show'
  resources :companies

  resources :users, only: [:new, :create]

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'authorized', to: 'sessions#page_requires_login'

end
