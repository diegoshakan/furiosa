FactoryBot.define do
  factory :announcement do
    title { FFaker::Product.brand }
    description { FFaker::Product.product }
    code { FFaker::AddressAU.building_number }
    value { FFaker::Number.decimal }

    association :user
    association :category
  end
end
