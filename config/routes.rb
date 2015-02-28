Rails.application.routes.draw do
  resources :clients, only: :none do
    post :login, on: :collection
  end

  resources :professionals, only: :index

  root to: 'static#home'
end
