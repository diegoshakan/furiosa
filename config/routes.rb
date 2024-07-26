Rails.application.routes.draw do
  root "pages#home"
  get "announcement/:id" => "pages#show"
  devise_for :users

  resources :announcements do
    resources :comments, only: [ :create, :update, :destroy ]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
