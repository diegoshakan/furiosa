class Announcement < ApplicationRecord
  include Announcements::Helpers

  before_create :create_code

  belongs_to :user
  belongs_to :category

  validates :title, :description, :value, presence: true
  validates :title, length: { minimum: 2, maximum: 75 }
  validates :description, length: { minimum: 3, maximum: 250 }
end
