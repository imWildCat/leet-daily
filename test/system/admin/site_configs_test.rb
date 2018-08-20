require "application_system_test_case"

class Admin::SiteConfigsTest < ApplicationSystemTestCase
  setup do
    @admin_site_config = admin_site_configs(:one)
  end

  test "visiting the index" do
    visit admin_site_configs_url
    assert_selector "h1", text: "Admin/Site Configs"
  end

  test "creating a Site config" do
    visit admin_site_configs_url
    click_on "New Admin/Site Config"

    click_on "Create Site config"

    assert_text "Site config was successfully created"
    click_on "Back"
  end

  test "updating a Site config" do
    visit admin_site_configs_url
    click_on "Edit", match: :first

    click_on "Update Site config"

    assert_text "Site config was successfully updated"
    click_on "Back"
  end

  test "destroying a Site config" do
    visit admin_site_configs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Site config was successfully destroyed"
  end
end
