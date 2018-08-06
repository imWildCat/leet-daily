class CreateLeetcodeUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :leetcode_users do |t|
      t.string :leetcode_id, null: false
      t.references :user, foreign_key: true
      t.json :data

      t.timestamps
    end

    add_index :leetcode_users, :leetcode_id, unique: true
  end
end
