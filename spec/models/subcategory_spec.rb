require 'rails_helper'

RSpec.describe Subcategory, type: :model do
  describe "validations" do
    subject { FactoryBot.build(:subcategory) }
    
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2).on(:create) }
    it { should validate_length_of(:name).is_at_most(25).on(:create) }

    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end

  describe 'associations' do
    it { should belong_to(:category) }
  end
end