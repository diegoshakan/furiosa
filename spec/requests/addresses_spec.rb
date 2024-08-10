require "rails_helper"

RSpec.describe "/addresses", type: :request do
  before :each do
    sign_in user
  end

  let(:user) { create(:user) }
  let(:valid_attributes) {
    build(:address, zip_code: "59144000", user: user).attributes
  }

  let(:invalid_attributes) {
    attributes_for(:address, street: nil)
  }

  describe "GET /index" do
    it "renders a successful response" do
      Address.create! valid_attributes
      get addresses_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      address = Address.create! valid_attributes
      get address_url(address)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_address_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      address = Address.create! valid_attributes
      get edit_address_url(address)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Address" do
        expect {
          post addresses_url, params: { address: valid_attributes }
        }.to change(Address, :count).by(1)
      end

      it "redirects to the created address" do
        post addresses_url, params: { address: valid_attributes }
        expect(response).to redirect_to(address_url(Address.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Address" do
        expect {
          post addresses_url, params: { address: invalid_attributes }
        }.to change(Address, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post addresses_url, params: { address: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { street: "new street" }
      }

      it "updates the requested address" do
        address = Address.create! valid_attributes
        patch address_url(address), params: { address: new_attributes }
        address.reload
        expect(flash[:notice]).to eq("Address was successfully updated.")
      end

      it "redirects to the address" do
        address = Address.create! valid_attributes
        patch address_url(address), params: { address: new_attributes }
        address.reload
        expect(response).to redirect_to(address_url(address))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        address = Address.create! valid_attributes
        patch address_url(address), params: { address: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested address" do
      address = Address.create! valid_attributes
      expect {
        delete address_url(address)
      }.to change(Address, :count).by(-1)
    end

    it "redirects to the addresses list" do
      address = Address.create! valid_attributes
      delete address_url(address)
      expect(response).to redirect_to(addresses_url)
    end
  end
end
