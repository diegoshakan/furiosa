require 'rails_helper'

RSpec.describe "Verify Address" do
  before do
    @user = FactoryBot.create(:user)
    @user2 = FactoryBot.create(:user)
    @address = FactoryBot.create(:address, user: @user2)
  end

  context "#call" do
    it "without announcements and address" do
      result = ::Announcements::VerifyAddress.call(@user)

      expect(result).to be_truthy
    end

    it "with announcements and address" do
      result = ::Announcements::VerifyAddress.call(@user2)

      expect(result).to be_falsey
    end
  end
end