require 'rails_helper'

RSpec.describe "Profile", type: :request do
  let(:user) { create(:user) }

  before do
    sign_in user
  end

  describe "GET #show" do
    it "renders a successful response" do
      get profile_show_path

      expect(response).to be_successful
      expect(response.body).to include(user.email)
    end
  end
end
