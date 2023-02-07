require "test_helper"

class SharedTripsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get shared_trips_show_url
    assert_response :success
  end
end
