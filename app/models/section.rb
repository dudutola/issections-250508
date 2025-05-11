class Section < ApplicationRecord
  has_many :issues, dependent: :destroy
  has_many :steps, dependent: :destroy

  validates :name, presence: true
end
