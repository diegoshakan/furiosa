class Category < ApplicationRecord
  acts_as_paranoid

  has_many :announcements
end
