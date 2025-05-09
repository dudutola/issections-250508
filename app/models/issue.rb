class Issue < ApplicationRecord
  belongs_to :section
  has_one_attached :image

  validates :title, presence: true
end
