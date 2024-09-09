Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "welcome#show"

  scope path_names: { new: "ny", edit: "rediger" } do
    resource :device, path: "enhed"
    resource :user,   path: "bruger"
    resource :search, path: "søg"

    resources :search_agents, path: "søgeagenter"
    resources :email_address_verifications, path: "bekræftelser"
  end

  resources :updates

  namespace :oda do
    resources :actors,       path: "aktører"
    resources :deletions
    resources :documents,    path: "dokumenter"
    resources :cases,        path: "sager"
    resources :decisions,    path: "afstemniger"
    resources :descriptions, path: "beskrivelser"
    resources :meetings,     path: "møder"
    resources :periods,      path: "perioder"
    resources :subjects,     path: "emneord"
  end

  mount MissionControl::Jobs::Engine, at: "/jobs"
end
