Rails.application.routes.draw do
  apipie

  resources :costumers, only: [:index, :create, :show, :update, :destroy]

  post '/login', to: 'login#login'
end
