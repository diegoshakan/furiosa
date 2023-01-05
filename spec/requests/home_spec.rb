require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index" do
    it "is success" do
      user = create(:user)
      sign_in user
      get root_path
      expect(response).to have_http_status(:success)
    end
  end

end
