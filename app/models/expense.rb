class Expense < ApplicationRecord
  belongs_to :group

  validates :name, :author_id, presence: true
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
