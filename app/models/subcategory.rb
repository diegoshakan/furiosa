class Subcategory < ApplicationRecord
  acts_as_paranoid

  belongs_to :category

  has_many :announcements, through: :category
end
