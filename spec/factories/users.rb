FactoryBot.define do
  factory :user do
    first_name { FFaker::NameBR.first_name }
    sequence(:email) { FFaker::Internet.email }
    password { "changeme" }
  end
end
