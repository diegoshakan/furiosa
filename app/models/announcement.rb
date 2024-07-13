class Announcement < ApplicationRecord
  include Announcements::Helpers

  before_create :create_code

  acts_as_paranoid

  belongs_to :user
  belongs_to :category
end
