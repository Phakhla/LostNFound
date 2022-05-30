require "application_system_test_case"

class FoundsTest < ApplicationSystemTestCase
  setup do
    @found = founds(:one)
  end

  test "visiting the index" do
    visit founds_url
    assert_selector "h1", text: "Founds"
  end

  test "should create found" do
    visit founds_url
    click_on "New found"

    fill_in "Date", with: @found.date
    fill_in "Detail", with: @found.detail
    fill_in "Location", with: @found.location
    fill_in "Name", with: @found.name
    fill_in "Time", with: @found.time
    fill_in "Types", with: @found.types
    click_on "Create Found"

    assert_text "Found was successfully created"
    click_on "Back"
  end

  test "should update Found" do
    visit found_url(@found)
    click_on "Edit this found", match: :first

    fill_in "Date", with: @found.date
    fill_in "Detail", with: @found.detail
    fill_in "Location", with: @found.location
    fill_in "Name", with: @found.name
    fill_in "Time", with: @found.time
    fill_in "Types", with: @found.types
    click_on "Update Found"

    assert_text "Found was successfully updated"
    click_on "Back"
  end

  test "should destroy Found" do
    visit found_url(@found)
    click_on "Destroy this found", match: :first

    assert_text "Found was successfully destroyed"
  end
end
