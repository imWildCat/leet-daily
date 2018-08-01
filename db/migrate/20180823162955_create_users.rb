class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email
      t.string :username
      t.string :password_digest
      t.string :leetcode_id
      t.references :user_group, foreign_key: true

      t.timestamps
    end
  end
end
