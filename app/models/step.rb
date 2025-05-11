class Step < ApplicationRecord
  belongs_to :section

  validates :title, presence: true
  validates :description, presence: true
  validates :content, presence: true
end
