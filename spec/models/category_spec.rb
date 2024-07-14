require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it { should have_many(:subcategories) }
  end
  
  describe "validations" do
    subject { FactoryBot.build(:category) }
    
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_least(2).on(:create) }
    it { should validate_length_of(:name).is_at_most(25).on(:create) }

    it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  end
end
