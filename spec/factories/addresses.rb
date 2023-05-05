FactoryBot.define do
  factory :address do
    city { FFaker::AddressBR.city }
    complement { FFaker::AddressBR.complement }
    neighborhood { FFaker::AddressBR.neighborhood }
    number { FFaker::AddressBR.building_number }
    state { FFaker::AddressBR.state }
    street { FFaker::AddressBR.street }
    zip_code { FFaker::AddressBR.zip_code }
  end
end
