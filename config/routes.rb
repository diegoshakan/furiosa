Rails.application.routes.draw do
  resources :announcements
  devise_for :users
  root "home#index"
end
