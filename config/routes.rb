Rails.application.routes.draw do
  get 'pages/goal'
  resources :wishlists
 root "pages#dashboard"
end
