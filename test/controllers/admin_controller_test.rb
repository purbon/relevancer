require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest

  setup do
    sign_in users(:one)
  end

  test "should get index" do
    get admin_root_url
    assert_response :success
  end

end
