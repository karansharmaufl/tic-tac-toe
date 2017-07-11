class HomeController < ApplicationController
  def helloworld
    if user_signed_in?
      redirect_to game_board_url
    end
  end
  
end
