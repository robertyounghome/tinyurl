require "application_system_test_case"

class UsedUrlsTest < ApplicationSystemTestCase
  setup do
    @used_url = used_urls(:one)
  end

  test "visiting the index" do
    visit used_urls_url
    assert_selector "h1", text: "Used Urls"
  end

  test "creating a Used url" do
    visit used_urls_url
    click_on "New Used Url"

    fill_in "Long name", with: @used_url.long_name
    fill_in "Short name", with: @used_url.short_name
    click_on "Create Used url"

    assert_text "Used url was successfully created"
    click_on "Back"
  end

  test "updating a Used url" do
    visit used_urls_url
    click_on "Edit", match: :first

    fill_in "Long name", with: @used_url.long_name
    fill_in "Short name", with: @used_url.short_name
    click_on "Update Used url"

    assert_text "Used url was successfully updated"
    click_on "Back"
  end

  test "destroying a Used url" do
    visit used_urls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Used url was successfully destroyed"
  end
end
