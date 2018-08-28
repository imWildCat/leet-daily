class CreateSiteConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :site_configs do |t|
      t.string :key, null: false
      t.text :value
      t.string :description

      t.timestamps
    end
  end
end
