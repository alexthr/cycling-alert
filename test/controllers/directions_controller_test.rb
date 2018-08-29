require 'test_helper'

class DirectionsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get directions_show_url
    assert_response :success
  end

  test "should get new" do
    get directions_new_url
    assert_response :success
  end

end
