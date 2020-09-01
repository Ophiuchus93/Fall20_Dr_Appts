Rails.application.routes.draw do
  root "doctors#index"

  resources :doctors
  resources :patients do
    resources :appts, only: [:index, :new, :create, :destroy]
  end
end
