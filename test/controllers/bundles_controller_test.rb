require 'test_helper'

class BundlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get bundles_index_url
    assert_response :success
  end

  test "should get show" do
    get bundles_show_url
    assert_response :success
  end

  test "should get new" do
    get bundles_new_url
    assert_response :success
  end

  test "should get create" do
    get bundles_create_url
    assert_response :success
  end

  test "should get destroy" do
    get bundles_destroy_url
    assert_response :success
  end

end
