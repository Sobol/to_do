class ApplicationController < ActionController::Base
  http_basic_authenticate_with :name => "amberbit", :password => "32167"
  protect_from_forgery
end
