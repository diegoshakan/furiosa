require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:neighborhood) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:street) }
    it { should validate_presence_of(:zip_code) }
    it { should validate_length_of(:city).is_at_least(3).is_at_most(35) }
    it { should validate_length_of(:state).is_at_least(3).is_at_most(35) }
    it { should validate_length_of(:street).is_at_least(3).is_at_most(125) }
    it { should validate_length_of(:zip_code).is_equal_to(8) }
  end
end
