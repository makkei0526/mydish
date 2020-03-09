require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get cerate" do
    get sessions_cerate_url
    assert_response :success
  end

  test "should get destroy" do
    get sessions_destroy_url
    assert_response :success
  end

end
