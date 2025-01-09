Rails.application.routes.draw do
  resources :messages, only: [:index, :create, :destroy]
  root 'messages#index'
end

