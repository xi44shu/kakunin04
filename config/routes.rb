Rails.application.routes.draw do
  devise_for :users
  resources :teams
  resources :calendars
  root to: "calendars#index"
end
