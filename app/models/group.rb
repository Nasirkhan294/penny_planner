class Group < ApplicationRecord
  belongs_to :user
  has_many :expenses

  def total_amount
    expenses.sum(:amount)
  end
end
