require 'rails_helper'

RSpec.describe "Announcements", type: :request do
  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:announcement) { create(:announcement, user: user, category: category) }

  let(:valid_attributes) { attributes_for(:announcement, user_id: user.id, category: category) }
  let(:invalid_attributes) { attributes_for(:announcement, title: nil, user_id: user.id, category: category) }

  before do
    sign_in user
  end

  describe "GET /announcements" do
    it "renders a successful response" do
      get announcements_url

      expect(response).to be_successful
    end
  end

  describe "GET /announcements/:id" do
    it "renders a successful response" do
      get announcement_url(announcement)

      expect(response).to be_successful
      expect(response.body).to include(announcement.title)
    end
  end

  describe "GET /announcements/new" do
    context "User has address" do
      before do
        user.build_address(attributes_for(:address))
      end

      it "renders a successful response" do
        get new_announcement_url

        expect(response).to be_successful
      end
    end

    context "User do not have address" do
      it "redirect to new address if user do not have address" do
        get new_announcement_url

        expect(response).to redirect_to(new_address_url)
      end
    end
  end

  describe "GET /announcements/:id/edit" do
    it "renders a successful response" do
      get edit_announcement_url(announcement)

      expect(response).to be_successful
    end
  end

  describe "POST /announcements" do
    context "with valid parameters" do
      it "creates a new Announcement" do
        expect {
          post announcements_url, params: { announcement: valid_attributes }
        }.to change(Announcement, :count).by(1)
      end

      it "renders a successful response" do
        post announcements_url, params: { announcement: valid_attributes }

        expect(response).to redirect_to(announcement_url(Announcement.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Announcement" do
        expect {
          post announcements_url, params: { announcement: invalid_attributes }
        }.to change(Announcement, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post announcements_url, params: { announcement: invalid_attributes }

        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      let(:new_attributes) { { title: "Novo Anúncio" } }

      it "updates the requested announcement" do
        announcement = Announcement.create! valid_attributes
        patch announcement_url(announcement), params: { announcement: new_attributes }
        announcement.reload

        expect(announcement.title).to eq(new_attributes[:title])
      end

      it "redirects to the announcement" do
        announcement = Announcement.create! valid_attributes
        patch announcement_url(announcement), params: { announcement: new_attributes }
        announcement.reload

        expect(response).to redirect_to(announcement_url(announcement))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        announcement = Announcement.create! valid_attributes
        patch announcement_url(announcement), params: { announcement: invalid_attributes }

        expect(response).to have_http_status(422)
      end
    end
  end

  describe "DELETE /announcements/:id" do
    it "destroy the requested announcement" do
      announcement = Announcement.create! valid_attributes

      expect {
        delete announcement_url(announcement)
      }.to change(Announcement, :count).by(-1)
    end

    it "redirect to the announcements list" do
      announcement = Announcement.create! valid_attributes
      delete announcement_url(announcement)
      expect(response).to redirect_to(announcements_url)
    end
  end
end
