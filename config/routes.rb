Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  resources :announcements

  get 'profile', to: "profile#show"
end
