class UserGroup < ApplicationRecord

  validates :name, presence: true, uniqueness: true

end
