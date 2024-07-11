class Category < ApplicationRecord
    has_many :subcategories
    
    validates :name, presence: true, uniqueness: true
    validates :name, length: { minimum: 2, maximum: 25 }
end
