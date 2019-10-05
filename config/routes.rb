Rails.application.routes.draw do
  get "sessions/new"
  root "sessions#new"
  post "/signup",  to: "users#create"
  get  "/signup",  to: "users#new"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :users
  resources :characters
  resources :questions
  resources :majors
end
