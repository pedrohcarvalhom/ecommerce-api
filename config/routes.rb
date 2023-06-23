Rails.application.routes.draw do
  apipie

  get '/', to: 'home#index'

  resources :costumers, only: [:index, :create, :show, :update, :destroy]
  resources :products, :categories

  post '/login', to: 'login#login'
  post '/validate', to: 'login#validate'
end
