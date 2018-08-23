class CreateUserGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :user_groups do |t|
      t.string :name
      t.string :description

      t.timestamps
    end

    add_index :user_groups, :name, unique: true
  end
end
