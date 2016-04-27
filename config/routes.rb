Rails.application.routes.draw do
  root to: 'welcome#home'
  get 'about', to: 'welcome#about'
  get 'signup', to: 'users#new'
  get    'login' , to: 'sessions#new'
  post   'login' , to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts
end
