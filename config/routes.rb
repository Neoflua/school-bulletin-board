Rails.application.routes.draw do
  root "home#index"
  
  get "search", to: "search#index"
  
  resources :categories, only: [:index, :show] do
    resources :posts, only: [:index, :new, :create]
  end
  
  resources :posts, only: [:show, :edit, :update, :destroy] do
    resources :comments, only: [:create, :destroy]
  end
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to enable in config/routes.rb too!)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
end
