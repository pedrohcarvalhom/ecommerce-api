Rails.application.routes.draw do
  apipie

  resources :costumers, only: [:index, :create, :show, :update, :destroy]
end
