FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "furiosa#{n}@example.com" }
    password { "changeme" }
  end
end
