class LeetcodeUser < ApplicationRecord
  belongs_to :user, optional: true
  has_many :leetcode_user_checkins

  validates :leetcode_id, uniqueness: true, presence: true

end
