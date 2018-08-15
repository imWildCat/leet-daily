class LeetcodeUser < ApplicationRecord
  belongs_to :user

  validates :leetcode_id, uniqueness: true, presence: true

end
