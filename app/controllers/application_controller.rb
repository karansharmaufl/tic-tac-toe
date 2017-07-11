class ApplicationController < ActionController::Base
  #alias acting_user current_user
  protect_from_forgery with: :exception
end
