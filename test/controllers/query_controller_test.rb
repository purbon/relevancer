require 'test_helper'

class QueryControllerTest < ActionDispatch::IntegrationTest
 
  setup do
    sign_in users(:one)
  end

  test "should get index" do
    get admin_query_index_url
    assert_response :success
  end

  test "should get create" do
    get new_admin_query_url
    assert_response :success
  end

end
