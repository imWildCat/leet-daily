require "application_system_test_case"

class Admin::LeetcodeUserCheckinsTest < ApplicationSystemTestCase
  setup do
    @admin_leetcode_user_checkin = admin_leetcode_user_checkins(:one)
  end

  test "visiting the index" do
    visit admin_leetcode_user_checkins_url
    assert_selector "h1", text: "Admin/Leetcode User Checkins"
  end

  test "creating a Leetcode user checkin" do
    visit admin_leetcode_user_checkins_url
    click_on "New Admin/Leetcode User Checkin"

    click_on "Create Leetcode user checkin"

    assert_text "Leetcode user checkin was successfully created"
    click_on "Back"
  end

  test "updating a Leetcode user checkin" do
    visit admin_leetcode_user_checkins_url
    click_on "Edit", match: :first

    click_on "Update Leetcode user checkin"

    assert_text "Leetcode user checkin was successfully updated"
    click_on "Back"
  end

  test "destroying a Leetcode user checkin" do
    visit admin_leetcode_user_checkins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Leetcode user checkin was successfully destroyed"
  end
end
