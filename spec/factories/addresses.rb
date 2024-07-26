FactoryBot.define do
  factory :address do
    zip_code { FFaker::AddressBR.zip_code }
    street { FFaker::AddressBR.street }
    number { FFaker::AddressBR.building_number }
    neighborhood { FFaker::AddressBR.neighborhood }
    complement { FFaker::AddressBR.complement }
    reference_point { FFaker::AddressBR.city_suffix }
    state { FFaker::AddressBR.state }
    city { FFaker::AddressBR.city }

    association :user
  end
end
