FactoryBot.define do
  factory :announcement do
    title { FFaker::Product.product_name }
    code { FFaker::Product.model }
    description { "MyString" }
    value { "100.00" }

    association :user
    association :category
  end
end
