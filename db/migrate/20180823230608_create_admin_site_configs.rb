class CreateAdminSiteConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :admin_site_configs do |t|

      t.timestamps
    end
  end
end
