class User < ApplicationRecord
  belongs_to :user_group
  has_many :leetcode_users

  after_initialize :set_default_values
  # Ref: https://stackoverflow.com/questions/328525/how-can-i-set-default-values-in-activerecord

  has_secure_password


  private

  def set_default_values
    self.user_group_id ||= 1
  end
end
