FactoryBot.define do
  factory :category do
    name { FFaker::Internet.domain_word }
  end
end
