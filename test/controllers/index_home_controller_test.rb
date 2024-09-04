require "test_helper"

class IndexHomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get index_home_index_url
    assert_response :success
  end
end
