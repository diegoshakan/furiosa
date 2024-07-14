FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    first_name { FFaker::NameBR.first_name }
    last_name { FFaker::NameBR.last_name }
    nickname { ["nickname", "namenick"].sample }
    cellphone { FFaker::PhoneNumberBR.mobile_phone_number.gsub(" ", "").gsub("-", "") }
    cpf_cnpj { FFaker::IdentificationBR.cpf }
    password { "changeme" }
  end
end
