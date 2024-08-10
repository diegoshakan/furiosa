require "rails_helper"

RSpec.describe Comment, type: :model do
  describe "associations" do
    it { should belong_to(:user) }
    it { should belong_to(:announcement) }
  end

  describe "validations" do
    it { should validate_presence_of(:content) }
    it { should validate_length_of(:content).is_at_least(2).is_at_most(250) }
  end
end
