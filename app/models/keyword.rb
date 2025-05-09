class Keyword < ApplicationRecord
  has_many :issue_keywords, dependent: :destroy
  has_many :issues, through: :issue_keywords

  validates :word, presence: true
end
