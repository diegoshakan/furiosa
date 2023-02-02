FactoryBot.define do
  factory :user do
    first_name { FFaker::NameBR.first_name }
    last_name { FFaker::NameBR.last_name }
    nickname { FFaker::NameBR.prefix }
    sequence(:email) { FFaker::Internet.email }
    password { "changeme" }
  end
end
