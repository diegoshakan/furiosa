class Category < ApplicationRecord
  acts_as_paranoid

  has_many :announcements
  has_many :subcategories
end
