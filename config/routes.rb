Rails.application.routes.draw do
  apipie

  get '/', to: 'home#index'

  resources :costumers, only: [:index, :create, :show, :update, :destroy]

  post '/login', to: 'login#login'
  post '/validate', to: 'login#validate'
end
