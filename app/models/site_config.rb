class SiteConfig < ApplicationRecord

  validates :key, presence: true, uniqueness: true

end
