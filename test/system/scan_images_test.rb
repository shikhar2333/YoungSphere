require "application_system_test_case"

class ScanImagesTest < ApplicationSystemTestCase
  setup do
    @scan_image = scan_images(:one)
  end

  test "visiting the index" do
    visit scan_images_url
    assert_selector "h1", text: "Scan Images"
  end

  test "creating a Scan image" do
    visit scan_images_url
    click_on "New Scan Image"

    fill_in "Label", with: @scan_image.label
    click_on "Create Scan image"

    assert_text "Scan image was successfully created"
    click_on "Back"
  end

  test "updating a Scan image" do
    visit scan_images_url
    click_on "Edit", match: :first

    fill_in "Label", with: @scan_image.label
    click_on "Update Scan image"

    assert_text "Scan image was successfully updated"
    click_on "Back"
  end

  test "destroying a Scan image" do
    visit scan_images_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Scan image was successfully destroyed"
  end
end
