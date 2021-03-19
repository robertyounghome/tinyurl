require "application_system_test_case"

class AvailableUrlsTest < ApplicationSystemTestCase
  setup do
    @available_url = available_urls(:one)
  end

  test "visiting the index" do
    visit available_urls_url
    assert_selector "h1", text: "Available Urls"
  end

  test "creating a Available url" do
    visit available_urls_url
    click_on "New Available Url"

    fill_in "Name", with: @available_url.name
    click_on "Create Available url"

    assert_text "Available url was successfully created"
    click_on "Back"
  end

  test "updating a Available url" do
    visit available_urls_url
    click_on "Edit", match: :first

    fill_in "Name", with: @available_url.name
    click_on "Update Available url"

    assert_text "Available url was successfully updated"
    click_on "Back"
  end

  test "destroying a Available url" do
    visit available_urls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Available url was successfully destroyed"
  end
end
