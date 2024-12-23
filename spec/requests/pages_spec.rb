require 'rails_helper'

RSpec.describe "Pages", type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:announcements) { create_list(:announcement, 5, user: user, category: category) }

  describe "GET #home" do
    it "renders a successful response" do
      get root_path

      expect(response).to be_successful
      expect(response.body).to include("Announcements")
    end
  end

  describe "GET #show" do
    it "renders a successful response" do
      get pages_show_path(announcements.first)

      expect(response).to be_successful
      expect(response.body).to include(announcements.first.title)
    end
  end
end
