Rails.application.routes.draw do
  root to: 'welcome#home'
  get 'signup', to: 'users#new'

  resources :users
end
