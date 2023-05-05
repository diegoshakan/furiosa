class Address < ApplicationRecord
  belongs_to :user

  validates :state, :city, presence: true
end
