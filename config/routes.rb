Rails.application.routes.draw do
  resources :costumers, only: [:index, :create, :show, :update, :destroy]
end
