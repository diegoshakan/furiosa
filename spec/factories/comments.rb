FactoryBot.define do
  factory :comment do
    content { FFaker::Book.description[2..110] }

    association :user
    association :announcement
  end
end
