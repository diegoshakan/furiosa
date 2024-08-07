class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :announcement

  validates :content, presence: true, length: { minimum: 2, maximum: 250 }
end
