Rails.application.routes.draw do
  devise_for :users

  root "pages#dashboard"

  resources :goals, only: [:index]

  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'


  resources :wishlists

 
end
