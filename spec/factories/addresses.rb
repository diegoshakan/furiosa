FactoryBot.define do
  factory :address do
    state { FFaker::AddressBR.state }
    city { FFaker::AddressBR.city }
    neighborhood { FFaker::AddressBR.neighborhood }
    street { FFaker::AddressBR.street }
    number { FFaker::AddressBR.building_number }
    zipcode { FFaker::AddressBR.zip_code }
    reference_point { FFaker::AddressBR.city_prefix }

    association :user
  end
end
