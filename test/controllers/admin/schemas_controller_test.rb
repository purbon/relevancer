require 'test_helper'

class Admin::SchemasControllerTest < ActionDispatch::IntegrationTest

  setup do
    sign_in users(:one)
  end
  
  test "should get index" do
    get admin_schema_index_url
    assert_response :success
  end

end
