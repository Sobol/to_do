ToDo::Application.routes.draw do
  offline = Rack::Offline.configure do
    cache ActionController::Base.helpers.asset_path("application.css")
    cache ActionController::Base.helpers.asset_path("application.js")
    network "/"
  end

  namespace :api do
    resources :tasks, only: [:index, :create, :update, :destroy]
    resources :task_counters, only: [:index, :create]
  end

  match "/application.manifest" => offline

  root :to => 'home#show'
end
