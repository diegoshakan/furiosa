class Category < ApplicationRecord
  has_many :announcements
  has_many :subcategories
end
