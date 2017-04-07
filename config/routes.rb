Rails.application.routes.draw do
  root 'product_searches#index'

  resources :product_searches, only: [:index]
end
