require "test_helper"

class TripContentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @trip_content = trip_contents(:one)
  end

  test "should get index" do
    get trip_contents_url
    assert_response :success
  end

  test "should get new" do
    get new_trip_content_url
    assert_response :success
  end

  test "should create trip_content" do
    assert_difference("TripContent.count") do
      post trip_contents_url, params: { trip_content: { content: @trip_content.content, timestamp: @trip_content.timestamp } }
    end

    assert_redirected_to trip_content_url(TripContent.last)
  end

  test "should show trip_content" do
    get trip_content_url(@trip_content)
    assert_response :success
  end

  test "should get edit" do
    get edit_trip_content_url(@trip_content)
    assert_response :success
  end

  test "should update trip_content" do
    patch trip_content_url(@trip_content), params: { trip_content: { content: @trip_content.content, timestamp: @trip_content.timestamp } }
    assert_redirected_to trip_content_url(@trip_content)
  end

  test "should destroy trip_content" do
    assert_difference("TripContent.count", -1) do
      delete trip_content_url(@trip_content)
    end

    assert_redirected_to trip_contents_url
  end
end
