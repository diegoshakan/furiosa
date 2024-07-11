FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    first_name { FFaker::NameBR.first_name }
    last_name { FFaker::NameBR.last_name }
    cellphone { FFaker::PhoneNumberBR.phone_number }
    cpf_cnpj { FFaker::IdentificationBR.cpf }
    password { "changeme" }
  end
end
