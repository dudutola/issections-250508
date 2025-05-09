class IssueKeyword < ApplicationRecord
  belongs_to :issue
  belongs_to :keyword
end
