class HomeController < ApplicationController
  def welcomepage
    if user_signed_in?
      redirect_to main_app_url
    end
  end  
end
