class LeetcodeUserCheckin < ApplicationRecord
  belongs_to :leetcode_user

  scope :default_list, -> {eager_load(:leetcode_user)}
end
