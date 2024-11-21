class Address < ApplicationRecord
  acts_as_paranoid

  belongs_to :user

  validates :zipcode, presence: true
end
