require "test_helper"

class UsedUrlsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @used_url = used_urls(:one)
  end

  test "should get index" do
    get used_urls_url
    assert_response :success
  end

  test "should get new" do
    get new_used_url_url
    assert_response :success
  end

  test "should create used_url" do
    assert_difference('UsedUrl.count') do
      post used_urls_url, params: { used_url: { long_name: @used_url.long_name, short_name: @used_url.short_name } }
    end

    assert_redirected_to used_url_url(UsedUrl.last)
  end

  test "should show used_url" do
    get used_url_url(@used_url)
    assert_response :success
  end

  test "should get edit" do
    get edit_used_url_url(@used_url)
    assert_response :success
  end

  test "should update used_url" do
    patch used_url_url(@used_url), params: { used_url: { long_name: @used_url.long_name, short_name: @used_url.short_name } }
    assert_redirected_to used_url_url(@used_url)
  end

  test "should destroy used_url" do
    assert_difference('UsedUrl.count', -1) do
      delete used_url_url(@used_url)
    end

    assert_redirected_to used_urls_url
  end
end
