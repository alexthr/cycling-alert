require 'test_helper'

class FixReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get fix_reports_new_url
    assert_response :success
  end

  test "should get create" do
    get fix_reports_create_url
    assert_response :success
  end

  test "should get edit" do
    get fix_reports_edit_url
    assert_response :success
  end

  test "should get update" do
    get fix_reports_update_url
    assert_response :success
  end

end
