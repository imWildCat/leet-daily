class User < ApplicationRecord
  belongs_to :user_group

  before_create :set_user_group_creation


  private

  def set_user_group_creation
    unless self.user_group_id
      self.user_group_id = 1
    end
  end
end
