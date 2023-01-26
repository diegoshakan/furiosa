require 'rails_helper'

RSpec.describe "Add Code" do
  before do
    @user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category)
    @announcement = FactoryBot.create(:announcement, user: @user, category: @category)
    @timestamp = Time.now.strftime("%Y%m%d_%H%M%S")
  end

  context "announcements" do
    it "#execute" do
      result = ::Announcements::AddCode.new({ announcement: @announcement }).execute

      expect(result).to eq(@timestamp)
    end
  end
end