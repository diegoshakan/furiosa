Rails.application.routes.draw do
  root "home#index"
  devise_for :users

  resources :addresses, except: [:index, :show, :destroy]
  resources :announcements do
    resources :comments
  end

  get 'view_announcement/:id', to: "home#show"
  get 'profile', to: "profile#show"
end
