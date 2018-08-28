class User < ApplicationRecord
  belongs_to :user_group
  has_many :leetcode_users

  after_initialize :set_default_values
  # Ref: https://stackoverflow.com/questions/328525/how-can-i-set-default-values-in-activerecord

  has_secure_password


  def send_reset_token(is_reset)
    token = SecureRandom.hex

    Rails.cache.write(User.pass_reset_token_key(token), self.id, expires_in: 15.days)

    UserNotifierMailer.set_or_reset_password(self, token, is_reset).deliver
  end

  def self.pass_reset_token_key(token)
    "pass_reset_#{token}"
  end

  private

  def set_default_values
    self.user_group_id ||= 1
  end
end
