Rails.application.routes.draw do
  root "pages#home"

  devise_for :users

  get "pages/show/:id", to: "pages#show", as: "pages_show"
  get "profile/show"

  resources :addresses, except: [ :index, :destroy ]
  resources :announcements

  # resources :categories #TODO: Recurso para criar quando tiver tela admin
  # resources :subcategories #TODO: Recurso para criar quando tiver tela admin

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
end
