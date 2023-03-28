require "application_system_test_case"

class PlatformsTest < ApplicationSystemTestCase
  setup do
    @platform = platforms(:one)
  end

  test "visiting the index" do
    visit platforms_url
    assert_selector "h1", text: "Platforms"
  end

  test "should create platform" do
    visit platforms_url
    click_on "New platform"

    fill_in "Description platform", with: @platform.description_platform
    fill_in "Name platform", with: @platform.name_platform
    click_on "Create Platform"

    assert_text "Platform was successfully created"
    click_on "Back"
  end

  test "should update Platform" do
    visit platform_url(@platform)
    click_on "Edit this platform", match: :first

    fill_in "Description platform", with: @platform.description_platform
    fill_in "Name platform", with: @platform.name_platform
    click_on "Update Platform"

    assert_text "Platform was successfully updated"
    click_on "Back"
  end

  test "should destroy Platform" do
    visit platform_url(@platform)
    click_on "Destroy this platform", match: :first

    assert_text "Platform was successfully destroyed"
  end
end
