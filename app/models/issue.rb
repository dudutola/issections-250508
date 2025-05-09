class Issue < ApplicationRecord
  belongs_to :section
  has_one_attached :image
  has_many :issue_keywords, dependent: :destroy
  has_many :keywords, through: :issue_keywords

  validates :title, presence: true
end
