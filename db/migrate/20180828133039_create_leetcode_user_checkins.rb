class CreateLeetcodeUserCheckins < ActiveRecord::Migration[5.2]
  def change
    create_table :leetcode_user_checkins do |t|
      t.references :leetcode_user, foreign_key: true
      t.date :on_date
      t.integer :finished_count

      t.timestamps
    end

    add_index :leetcode_user_checkins, [:leetcode_user_id, :on_date], unique: true
  end
end
