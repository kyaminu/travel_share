require "application_system_test_case"

class TripContentsTest < ApplicationSystemTestCase
  setup do
    @trip_content = trip_contents(:one)
  end

  test "visiting the index" do
    visit trip_contents_url
    assert_selector "h1", text: "Trip contents"
  end

  test "should create trip content" do
    visit trip_contents_url
    click_on "New trip content"

    fill_in "Content", with: @trip_content.content
    fill_in "Timestamp", with: @trip_content.timestamp
    click_on "Create Trip content"

    assert_text "Trip content was successfully created"
    click_on "Back"
  end

  test "should update Trip content" do
    visit trip_content_url(@trip_content)
    click_on "Edit this trip content", match: :first

    fill_in "Content", with: @trip_content.content
    fill_in "Timestamp", with: @trip_content.timestamp
    click_on "Update Trip content"

    assert_text "Trip content was successfully updated"
    click_on "Back"
  end

  test "should destroy Trip content" do
    visit trip_content_url(@trip_content)
    click_on "Destroy this trip content", match: :first

    assert_text "Trip content was successfully destroyed"
  end
end
