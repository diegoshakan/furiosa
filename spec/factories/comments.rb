FactoryBot.define do
  factory :comment do
    content { FFaker::Book.description }
  end
end
