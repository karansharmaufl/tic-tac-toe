require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get app" do
    get main_app_url
    assert_response :success
  end

end
