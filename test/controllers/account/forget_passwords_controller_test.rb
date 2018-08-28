require 'test_helper'

class Account::ForgetPasswordsControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get account_forget_passwords_edit_url
    assert_response :success
  end

  test "should get update" do
    get account_forget_passwords_update_url
    assert_response :success
  end

end
