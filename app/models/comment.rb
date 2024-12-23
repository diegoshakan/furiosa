class Comment < ApplicationRecord
  acts_as_paranoid

  belongs_to :announcement

  validates :content, presence: true
end
