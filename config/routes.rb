Rails.application.routes.draw do
  resources :clients, only: :none do
    post :login, on: :collection
  end

  resources :specialties, only: :index do
    get :autocomplete, on: :collection
    resources :professionals, only: :index
  end

  root to: 'static#home'
end
