class CreateLeetcodeUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :leetcode_users do |t|
      t.string :leetcode_id
      t.json :data

      t.timestamps
    end
  end
end
