FactoryBot.define do
  factory :comment do
    body { "MyText" }
    announcement { nil }
    user { nil }
  end
end
