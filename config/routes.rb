Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :teams
  resources :calendars
  root to: "calendars#index"
end
