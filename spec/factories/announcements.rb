FactoryBot.define do
  factory :announcement do
    title { FFaker::Product.product_name }
    description { FFaker::Book.description[3..250] }
    code { DateTime.now.strftime("%Y%m%d%H%M%S%L") }
    value { [9.99, 101.00, 59200].sample }
    
    association :user
    association :category
  end
end
