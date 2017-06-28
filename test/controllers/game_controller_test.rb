require 'test_helper'

class GameControllerTest < ActionDispatch::IntegrationTest
  test "should get button" do
    get game_button_url
    assert_response :success
  end

end
