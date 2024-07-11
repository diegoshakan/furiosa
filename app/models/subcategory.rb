class Subcategory < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, uniqueness: true
  validates :name, length: { minimum: 2, maximum: 25 }
end
