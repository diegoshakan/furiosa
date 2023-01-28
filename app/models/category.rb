class Category < ApplicationRecord
  has_many :announcements, dependent: :destroy
  has_many :subcategories, dependent: :destroy
end
