FactoryBot.define do
  factory :address do
    cep { "MyString" }
    rua { "MyString" }
    numero { "MyString" }
    complemento { "MyString" }
    ponto_de_referencia { "MyString" }
    uf { "MyString" }
    cidade { "MyString" }
    user { nil }
  end
end
