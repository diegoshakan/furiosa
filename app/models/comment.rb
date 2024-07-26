class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :announcement

  validates :content, presence: true, length: { in: 2..250 }
end
