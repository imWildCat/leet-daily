require 'test_helper'

class Account::ForgetPasswordControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get account_forget_password_edit_url
    assert_response :success
  end

  test "should get update" do
    get account_forget_password_update_url
    assert_response :success
  end

end
