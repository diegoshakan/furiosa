FactoryBot.define do
  factory :subcategory do
    name { FFaker::Game.category }
    
    association :category
  end
end
