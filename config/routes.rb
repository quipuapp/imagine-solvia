Rails.application.routes.draw do
  resources :specialties, only: :none do
    get :autocomplete, on: :collection
  end

  resources :professionals, only: [:index, :show]

  get "loading" => "static#loading"
  root to: 'static#landing'
end
