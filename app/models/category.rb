class Category < ApplicationRecord
  has_many :subcategories

  validates :name, presence: true, uniqueness: true
  validates :name, length: { in: 2..25 }
end
