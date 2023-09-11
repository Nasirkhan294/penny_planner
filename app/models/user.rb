class User < ApplicationRecord
  has_many :groups
  has_many :expenses, through: groups

  validates :name, presence: true
end
