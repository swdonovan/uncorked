Rails.application.routes.draw do
  root to: "home#show"

  get "/logout", to: "sessions#destroy"
end
