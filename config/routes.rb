Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  resources :announcements

  get 'profile', to: "profile#show"
  get 'view_announcement/:id', to: "home#show"
  get 'search', to: "search#search"
end
