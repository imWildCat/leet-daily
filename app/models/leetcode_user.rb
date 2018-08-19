class LeetcodeUser < ApplicationRecord
  belongs_to :user, optional: true

  validates :leetcode_id, uniqueness: true, presence: true

end
