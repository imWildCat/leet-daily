require 'test_helper'

class Admin::SiteConfigsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_site_config = admin_site_configs(:one)
  end

  test "should get index" do
    get admin_site_configs_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_site_config_url
    assert_response :success
  end

  test "should create admin_site_config" do
    assert_difference('Admin::SiteConfig.count') do
      post admin_site_configs_url, params: { admin_site_config: {  } }
    end

    assert_redirected_to admin_site_config_url(Admin::SiteConfig.last)
  end

  test "should show admin_site_config" do
    get admin_site_config_url(@admin_site_config)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_site_config_url(@admin_site_config)
    assert_response :success
  end

  test "should update admin_site_config" do
    patch admin_site_config_url(@admin_site_config), params: { admin_site_config: {  } }
    assert_redirected_to admin_site_config_url(@admin_site_config)
  end

  test "should destroy admin_site_config" do
    assert_difference('Admin::SiteConfig.count', -1) do
      delete admin_site_config_url(@admin_site_config)
    end

    assert_redirected_to admin_site_configs_url
  end
end
