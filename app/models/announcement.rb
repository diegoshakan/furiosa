class Announcement < ApplicationRecord
  include Announcements::Helpers

  before_create :create_code # in Announcements::Helpers

  belongs_to :user
  belongs_to :category

  has_many :comments

  validates :title, :description, :value, presence: true
  validates :title, length: { in: 2..75 }
  validates :description, length: { in: 3..250 }
end
