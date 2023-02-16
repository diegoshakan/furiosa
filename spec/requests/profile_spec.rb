require 'rails_helper'

RSpec.describe "Profiles", type: :request do
  let(:user){ FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe "GET /show" do
    it "returns http success" do
      get "/profile"
      expect(response).to have_http_status(:success)
    end
  end

end
