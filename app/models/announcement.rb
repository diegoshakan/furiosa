class Announcement < ApplicationRecord
  acts_as_paranoid

  belongs_to :user
  belongs_to :category, optional: true
end
