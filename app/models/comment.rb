class Comment < ApplicationRecord
  acts_as_paranoid

  belongs_to :announcement
end
