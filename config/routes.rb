Rails.application.routes.draw do
  resources :addresses
  root "home#index"
  devise_for :users

  resources :announcements do
    resources :comments
  end

  get 'view_announcement/:id', to: "home#show"
  get 'profile', to: "profile#show"
end
