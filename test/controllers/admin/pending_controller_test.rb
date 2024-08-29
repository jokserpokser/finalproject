require "test_helper"

class Admin::PendingControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_pending_index_url
    assert_response :success
  end
end
