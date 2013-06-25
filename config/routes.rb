ToDo::Application.routes.draw do
  offline = Rack::Offline.configure do
    cache ActionController::Base.helpers.asset_path("application.css.scss")
    cache ActionController::Base.helpers.asset_path("application.js.coffee")
    network "/"
  end

  namespace :api do
    resources :tasks, only: [:index, :create, :update, :destroy]
  end

  match "/application.manifest" => offline

  root :to => 'home#show'
end
