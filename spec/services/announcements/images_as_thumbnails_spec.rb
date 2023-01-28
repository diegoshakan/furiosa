require 'rails_helper'

RSpec.describe "Images as Thumbnails" do
  before do
    @user = FactoryBot.create(:user)
    @category = FactoryBot.create(:category)
    image = Rack::Test::UploadedFile.new('spec/fixtures/placa.jpg')
    @announcement = FactoryBot.create(:announcement, user: @user, category: @category, images: [image])
  end

  context "announcements" do
    it "#execute" do
      result = ::Announcements::ImagesAsThumbnails.new({ announcement: @announcement }).execute

      expect(result.first.processed?).to be_truthy
    end
  end
end