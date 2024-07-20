require 'rails_helper'

RSpec.describe Announcement, type: :model do
  describe 'associations' do
    it { should belong_to(:category) }
    it { should belong_to(:user) }
  end

  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:value) }
    it { should validate_length_of(:title).is_at_least(2).on(:create) }
    it { should validate_length_of(:title).is_at_most(75).on(:create) }
    it { should validate_length_of(:description).is_at_least(3).on(:create) }
    it { should validate_length_of(:description).is_at_most(250).on(:create) }
  end
end
