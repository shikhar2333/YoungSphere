require 'test_helper'

class ScanImagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scan_image = scan_images(:one)
  end

  test "should get index" do
    get scan_images_url
    assert_response :success
  end

  test "should get new" do
    get new_scan_image_url
    assert_response :success
  end

  test "should create scan_image" do
    assert_difference('ScanImage.count') do
      post scan_images_url, params: { scan_image: { label: @scan_image.label } }
    end

    assert_redirected_to scan_image_url(ScanImage.last)
  end

  test "should show scan_image" do
    get scan_image_url(@scan_image)
    assert_response :success
  end

  test "should get edit" do
    get edit_scan_image_url(@scan_image)
    assert_response :success
  end

  test "should update scan_image" do
    patch scan_image_url(@scan_image), params: { scan_image: { label: @scan_image.label } }
    assert_redirected_to scan_image_url(@scan_image)
  end

  test "should destroy scan_image" do
    assert_difference('ScanImage.count', -1) do
      delete scan_image_url(@scan_image)
    end

    assert_redirected_to scan_images_url
  end
end
