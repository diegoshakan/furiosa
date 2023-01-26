class Announcement < ApplicationRecord
  before_save :add_code

  belongs_to :user
  belongs_to :category

  has_many_attached :images

  private

  def add_code
    ::Announcements::AddCode.new({ announcement: self }).execute
  end
end
