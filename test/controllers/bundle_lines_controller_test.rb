require 'test_helper'

class BundleLinesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get bundle_lines_create_url
    assert_response :success
  end

end
