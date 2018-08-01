class CreateSiteConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :site_configs do |t|
      t.string :key
      t.text :value

      t.timestamps
    end
  end
end
