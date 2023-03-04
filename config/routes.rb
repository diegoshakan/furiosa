Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  resources :announcements

  get 'view_announcement/:id', to: "home#show"
  get 'profile', to: "profile#show"
end
