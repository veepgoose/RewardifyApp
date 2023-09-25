require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get goal" do
    get pages_goal_url
    assert_response :success
  end
end
