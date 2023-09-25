Rails.application.routes.draw do
  devise_for :users

  root "pages#dashboard"

  resources :goals, only: [:new, :create, :show, :edit, :update, :destroy, :index]

  get 'goals', to: 'goals#index', as: 'goals_index'

  get 'dashboard', to: 'pages#dashboard', as: 'dashboard'

  resources :wishlists
end

