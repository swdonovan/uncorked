Rails.application.routes.draw do
  root to: "home#show"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :users, only: [:show, :create, :new, :edit, :update]
  resources :venues, only: [:index, :show]
  namespace :manager do
    resources :venues, only: [:index, :show, :new, :create, :edit, :update]
  end
  resources :wines, only: [:index, :show]
end
