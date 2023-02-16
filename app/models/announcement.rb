class Announcement < ApplicationRecord
  before_save :add_code

  belongs_to :user
  belongs_to :category

  has_many_attached :images, dependent: :destroy

  scope :all_announcements, -> { includes([:category, { images_attachments: :blob }]) }

  def images_as_thumbnail
    ::Announcements::ImagesAsThumbnails.new({ announcement: self }).execute
  end

  private

  def add_code
    ::Announcements::AddCode.new({ announcement: self }).execute
  end
end
