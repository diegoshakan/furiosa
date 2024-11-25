require 'rails_helper'

RSpec.describe "Addresses", type: :request do
  let(:user) { create(:user) }
  let(:address) { create(:address, user: user) }

  let(:valid_attributes) { attributes_for(:address, user_id: user.id) }
  let(:invalid_attributes) { attributes_for(:address, zipcode: nil) }

  before do
    sign_in user
  end

  describe "GET #show" do
    it "renders a successful response" do
      get address_url(address)

      expect(response).to be_successful
      expect(response.body).to include(address.street)
    end
  end

  describe "GET #new" do
    it "renders a successful response" do
      get new_address_url

      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "renders a successful response" do
      get edit_address_url(address)

      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Address" do
        expect {
          post addresses_url, params: { address: valid_attributes }
        }.to change(Address, :count).by(1)
      end

      it "renders a successful response" do
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

      it "renders a successful response (i.e. to display the 'new' template)" do
        post addresses_url, params: { address: invalid_attributes }
        expect(response).to have_http_status(422)
      end
    end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      let(:new_attributes) { { street: "Rua dos Testes" } }

      it "updates the requested address" do
        address = Address.create! valid_attributes
        patch address_url(address), params: { address: new_attributes }
        address.reload

        expect(address.street).to eq(new_attributes[:street])
      end

      it "redirects to the address" do
        address = Address.create! valid_attributes
        patch address_url(address), params: { address: new_attributes }
        address.reload

        expect(response).to redirect_to(address_url(address))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        address = Address.create! valid_attributes
        patch address_url(address), params: { address: invalid_attributes }

        expect(response).to have_http_status(422)
      end
    end
  end
end
