class Comment < ApplicationRecord
  belongs_to :announcement
  belongs_to :user

  validates :body, presence: true, length: { minimum: 3, maximum: 70 }
end
