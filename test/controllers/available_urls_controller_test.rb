require "test_helper"

class AvailableUrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @available_url = available_urls(:one)
  end

  test "should get index" do
    get available_urls_url
    assert_response :success
  end

  test "should get new" do
    get new_available_url_url
    assert_response :success
  end

  test "should create available_url" do
    assert_difference('AvailableUrl.count') do
      post available_urls_url, params: { available_url: { name: @available_url.name } }
    end

    assert_redirected_to available_url_url(AvailableUrl.last)
  end

  test "should show available_url" do
    get available_url_url(@available_url)
    assert_response :success
  end

  test "should get edit" do
    get edit_available_url_url(@available_url)
    assert_response :success
  end

  test "should update available_url" do
    patch available_url_url(@available_url), params: { available_url: { name: @available_url.name } }
    assert_redirected_to available_url_url(@available_url)
  end

  test "should destroy available_url" do
    assert_difference('AvailableUrl.count', -1) do
      delete available_url_url(@available_url)
    end

    assert_redirected_to available_urls_url
  end
end
