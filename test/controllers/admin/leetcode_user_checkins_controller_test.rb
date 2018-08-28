require 'test_helper'

class Admin::LeetcodeUserCheckinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_leetcode_user_checkin = admin_leetcode_user_checkins(:one)
  end

  test "should get index" do
    get admin_leetcode_user_checkins_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_leetcode_user_checkin_url
    assert_response :success
  end

  test "should create admin_leetcode_user_checkin" do
    assert_difference('Admin::LeetcodeUserCheckin.count') do
      post admin_leetcode_user_checkins_url, params: {admin_leetcode_user_checkin: {}}
    end

    assert_redirected_to admin_leetcode_user_checkin_url(Admin::LeetcodeUserCheckin.last)
  end

  test "should show admin_leetcode_user_checkin" do
    get admin_leetcode_user_checkin_url(@admin_leetcode_user_checkin)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_leetcode_user_checkin_url(@admin_leetcode_user_checkin)
    assert_response :success
  end

  test "should update admin_leetcode_user_checkin" do
    patch admin_leetcode_user_checkin_url(@admin_leetcode_user_checkin), params: {admin_leetcode_user_checkin: {}}
    assert_redirected_to admin_leetcode_user_checkin_url(@admin_leetcode_user_checkin)
  end

  test "should destroy admin_leetcode_user_checkin" do
    assert_difference('Admin::LeetcodeUserCheckin.count', -1) do
      delete admin_leetcode_user_checkin_url(@admin_leetcode_user_checkin)
    end

    assert_redirected_to admin_leetcode_user_checkins_url
  end
end
