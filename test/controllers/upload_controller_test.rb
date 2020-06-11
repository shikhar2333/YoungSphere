require 'test_helper'

class UploadControllerTest < ActionDispatch::IntegrationTest
  test "should get default" do
    get upload_default_url
    assert_response :success
  end

end
