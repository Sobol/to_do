ToDo::Application.routes.draw do
  resources :tasks
  offline = Rack::Offline.configure do
    cache ActionController::Base.helpers.asset_path("application.css")
    cache ActionController::Base.helpers.asset_path("application.js")
    network "/"
  end

  namespace :api do
    resources :tasks, only: [:index, :create, :update, :destroy]
  end

  match "/application.manifest" => offline

  root :to => 'tasks#index'
end
