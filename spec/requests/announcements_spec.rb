require 'rails_helper'

RSpec.describe "/announcements", type: :request do
  let(:user){ FactoryBot.create(:user) }
  let(:category){ FactoryBot.create(:category) }

  before do
    sign_in user
  end
  
  let(:valid_attributes) {
    { title: "Bolo de Casamento", value: "300.00", category_id: category.id, user_id: user.id }
  }

  let(:invalid_attributes) {
    { title: "Bolo de Casamento", value: "300.00", category_id: nil, user_id: nil }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Announcement.create! valid_attributes
      get announcements_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      announcement = Announcement.create! valid_attributes
      get announcement_url(announcement)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_announcement_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      announcement = Announcement.create! valid_attributes
      get edit_announcement_url(announcement)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Announcement" do
        expect {
          post announcements_url, params: { announcement: valid_attributes }
        }.to change(Announcement, :count).by(1)
      end

      it "redirects to the created announcement" do
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
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    let(:new_title){ FFaker::Product.name }
    context "with valid parameters" do
      let(:new_attributes) {
        { title: new_title }
      }

      it "updates the requested announcement" do
        announcement = Announcement.create! valid_attributes
        patch announcement_url(announcement), params: { announcement: new_attributes }
        announcement.reload
        expect(announcement.title).to eq(new_title)
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
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested announcement" do
      announcement = Announcement.create! valid_attributes
      expect {
        delete announcement_url(announcement)
      }.to change(Announcement, :count).by(-1)
    end

    it "redirects to the announcements list" do
      announcement = Announcement.create! valid_attributes
      delete announcement_url(announcement)
      expect(response).to redirect_to(announcements_url)
    end
  end
end
