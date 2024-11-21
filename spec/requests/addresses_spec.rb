require 'rails_helper'

RSpec.describe "Addresses", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:valid_attributes) { FactoryBot.attributes_for(:address, user_id: user.id) }

  let(:invalid_attributes) { FactoryBot.attributes_for(:address, user_id: nil) }

  before do
    sign_in user
  end

  describe "GET /show" do
    it "renders a successful response" do
      address = user.build_address valid_attributes
      address.save
      get address_url(address)
      byebug
      expect(response).to be_successful
    end
  end
end
