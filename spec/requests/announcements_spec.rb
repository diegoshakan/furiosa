require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/announcements", type: :request do
  before :each do
    sign_in user
  end

  let(:user) { create(:user) }
  let(:category) { create(:category) }
  let(:valid_attributes) {
    build(:announcement, user: user, category: category).attributes
  }

  let(:invalid_attributes) {
    attributes_for(:announcement, title: nil)
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


      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post announcements_url, params: { announcement: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { title: FFaker::Product.product_name }
      }

      it "updates the requested announcement" do
        announcement = Announcement.create! valid_attributes
        patch announcement_url(announcement), params: { announcement: new_attributes }
        announcement.reload
        expect(flash[:notice]).to eq("Announcement was successfully updated.")
      end

      it "redirects to the announcement" do
        announcement = Announcement.create! valid_attributes
        patch announcement_url(announcement), params: { announcement: new_attributes }
        announcement.reload
        expect(response).to redirect_to(announcement_url(announcement))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
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
