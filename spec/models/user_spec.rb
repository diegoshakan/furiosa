require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    subject { FactoryBot.build(:user) }
    
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:cpf_cnpj) }
    it { should validate_presence_of(:cellphone) }
    it { should validate_length_of(:first_name).is_at_least(3).on(:create) }
    it { should validate_length_of(:first_name).is_at_most(250).on(:create) }
    it { should_not validate_length_of(:first_name).is_at_least(2).on(:create).with_message("too short") }
    it { should_not validate_length_of(:first_name).is_at_most(251).on(:create).with_message("too long") }
    it { should validate_length_of(:last_name).is_at_least(3).on(:create) }
    it { should validate_length_of(:last_name).is_at_most(250).on(:create) }
    it { should_not validate_length_of(:last_name).is_at_least(2).on(:create).with_message("too short") }
    it { should_not validate_length_of(:last_name).is_at_most(251).on(:create).with_message("too long") }
    it { should validate_length_of(:nickname).is_at_least(3).on(:create) }
    it { should validate_length_of(:nickname).is_at_most(250).on(:create) }
    it { should_not validate_length_of(:nickname).is_at_least(2).on(:create).with_message("too short") }
    it { should_not validate_length_of(:nickname).is_at_most(251).on(:create).with_message("too long") }

    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_uniqueness_of(:cpf_cnpj).ignoring_case_sensitivity }

    it { should allow_value(FFaker::IdentificationBR.cpf).for(:cpf_cnpj) }
    it { should_not allow_value(FFaker::IdentificationBR.pretty_cpf).for(:cpf_cnpj).with_message(I18n.t("activemodel.user.errors.just_allow_numbers")) }
    it { should allow_value(FFaker::IdentificationBR.cnpj).for(:cpf_cnpj) }
    it { should_not allow_value(FFaker::IdentificationBR.pretty_cnpj).for(:cpf_cnpj).with_message(I18n.t("activemodel.user.errors.just_allow_numbers")) }
    it { should allow_value(FFaker::PhoneNumberBR.mobile_phone_number.gsub(" ", "").gsub("-", "")).for(:cellphone) }
    it { should_not allow_value(FFaker::PhoneNumberBR.international_phone_number).for(:cellphone).with_message(I18n.t("activemodel.user.errors.just_allow_numbers")) }
  end
end
