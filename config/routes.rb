Rails.application.routes.draw do
  
  devise_for :users
  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'
  get 'goals', to: 'pages#goal', as: 'goals'
  resources :wishlists

  root "pages#dashboard"
end
